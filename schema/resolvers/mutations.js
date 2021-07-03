
const errorHandler = require('../errorHandler')
const bcrypt = require('bcrypt')
const auth = require('../../auth')


const connection = require('../../store/db')
const util = require('util')
const query = util.promisify(connection.query).bind(connection)

module.exports ={
        signUp: async (root, {input}) =>{
            if(!input.password || !input.email){
                throw new Error ('Not email or password provided')
            }
            const defaults = {
                name: ''
            } 
            const newUser = Object.assign(defaults, input)
            newUser.password = await bcrypt.hash(newUser.password, 10)
            let user
            try{
                user = await query(`INSERT INTO users SET?`, newUser)
                // user = await db.collection('users').insertOne(newUser)
                newUser.id = user.insertId
            }
            catch(error){
                errorHandler(error, 'Error Creating User')
            }
            return newUser
        },
        signIn: async (root, {input}) =>{
            if(!input.password || !input.email){
                errorHandler('Not email or password provided')
            }
            let user
            let pass
            const defaults = {auth: false} 
            let token = Object.assign(defaults)
            try{
                user = await query(`SELECT * FROM users WHERE email="${input.email}"`)
                user = user[0]? JSON.parse(JSON.stringify(user[0])) : undefined
                // user = await db.collection('users').findOne({email: input.email})
                if (user) {pass = await bcrypt.compare(input.password, user.password)}
                else{throw new Error (`User Not found `)}
                if (pass) {
                    await query(`UPDATE users SET date=now() WHERE id=?`,user.id)
                    token.body = auth.sign(user);
                    token.auth = true
                    // Generar token;
                }else{
                    token.auth = false
                }
                
            }  
            catch (error){
                errorHandler(error)
            }
            return token
        },
        editUser: async (root, {id, input}) =>{
            let user
            try{
                await query(`UPDATE users SET ? WHERE id=?`,[input, id])
                user = await query(`SELECT * FROM users WHERE id=?`, id)
                // await db.collection('users').updateOne({_id : ObjectID(id)}, {$set: input})
                // user = await db.collection('users').findOne({_id : ObjectID(id)})
                // console.log(user)
            }
            catch(error){errorHandler(error)
            }
            return user
        },
        deleteUser: async (root, {id}) =>{
            let data
            try{
                user = await query(`SELECT * FROM users WHERE id='${id}'`)
                deleted = await query(`DELETE FROM users WHERE id='${id}'`)
                // user = await db.collection('users').findOne({_id : ObjectID(_id)})
                // deleted = await db.collection('users').deleteOne({_id : ObjectID(_id)})
                if(deleted.affectedRows !== 1 )throw new Error ('User not deleted')
            }
            catch(error){errorHandler(error)}
            return user
        },
        lessonViewed: async (root, {input}) =>{
            if(!input.user_id || !input.lesson_id){
                throw new Error ('Not user or lesson id provided')
            }
            const defaults = {
                viewed: true
            } 
            const lessonViewed = Object.assign(defaults, input)
            let userLesson
            let user
            let lesson
            try{
                // userLesson = await db.collection('userLessons').findOne({user_id:  ObjectID(lessonViewed.user_id), lesson_id:  ObjectID(lessonViewed.lesson_id)})
                userLesson = await query(`SELECT * FROM user_lessons WHERE user_id=? AND lesson_id=? `,[lessonViewed.user_id, lessonViewed.lesson_id]  )
                // userLesson = await JSON.parse(JSON.stringify(userLesson[0]))
                userLesson = userLesson[0]
                if(userLesson){
                    if(userLesson.viewed !== lessonViewed.viewed){
                        await query(`UPDATE user_lessons SET viewed=?,date=now() WHERE id=?`,[lessonViewed.viewed, userLesson.id])
                        userLesson = await query(`SELECT * FROM user_lessons WHERE id=?`,userLesson.id)
                        userLesson = userLesson[0]

                        // await db.collection('userLessons').updateOne({_id : ObjectID(userLesson._id)}, {$set: {viewed: lessonViewed.viewed}})
                        // userLesson = await db.collection('userLessons').findOne({_id : ObjectID(userLesson._id)})                 
                    }
                }else{
                    user = await query(`SELECT * FROM users WHERE id='${lessonViewed.user_id}'`)
                    user = user[0]

                    lesson = await query(`SELECT * FROM lessons WHERE id='${lessonViewed.lesson_id}'`)
                    lesson = lesson[0]
                    // user = await db.collection('users').findOne({_id: ObjectID(lessonViewed.user_id)})
                    // lesson = await db.collection('lessons').findOne({_id: ObjectID(lessonViewed.lesson_id)})
                    if(!user || !lesson){
                        throw new Error ('Not User or lesson found')
                    }
                    await query(`INSERT INTO user_lessons (user_id, lesson_id, viewed,date) VALUES ('${lessonViewed.user_id}','${lessonViewed.lesson_id}',${lessonViewed.viewed}, now())`)
                    userLesson = await query(`SELECT * FROM user_lessons WHERE user_id='${lessonViewed.user_id}' AND lesson_id='${lessonViewed.lesson_id}'`)
                    userLesson = userLesson[0]
                    // userLesson = await db.collection('userLessons').insertOne({user_id: ObjectID(lessonViewed.user_id),lesson_id: ObjectID(lessonViewed.lesson_id), viewed: lessonViewed.viewed })
                }
            }
            catch(error){
                errorHandler(error)
            }
            return userLesson
        }
}