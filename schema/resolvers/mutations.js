const connectDB = require('../../store/db')
const { ObjectID } = require('mongodb')
const errorHandler = require('../errorHandler')
const bcrypt = require('bcrypt')
const auth = require('../../auth')



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
            let db
            let user
            try{
                db = await connectDB()
                user = await db.collection('users').insertOne(newUser)
                newUser._id = user.insertedId
            }
            catch(error){
                errorHandler(error)
            }
            return newUser
        },
        signIn: async (root, {input}) =>{
            if(!input.password || !input.email){
                errorHandler('Not email or password provided')
            }
            let db
            let user
            const defaults = {auth: false} 
            let token = Object.assign(defaults)
            try{
                db = await connectDB()
                user = await db.collection('users').findOne({email: input.email})
                const pass = await bcrypt.compare(input.password, user.password)
                if (pass) {
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
            let db
            let user
            try{
                db = await connectDB()
                await db.collection('users').updateOne({_id : ObjectID(id)}, {$set: input})
                user = await db.collection('users').findOne({_id : ObjectID(id)})
                console.log(user)
            }
            catch(error){errorHandler(error)
            }
            return user
        },
        deleteUser: async (root, {_id}) =>{
            let db
            let user
            let deleted
            try{
                db = await connectDB()
                user = await db.collection('users').findOne({_id : ObjectID(_id)})
                deleted = await db.collection('users').deleteOne({_id : ObjectID(_id)})
                if(deleted.deletedCount !== 1 ){
                    throw new Error ('User not deleted')
                }
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
            let db
            let userLesson
            let user
            let lesson
            try{
                db = await connectDB()
                userLesson = await db.collection('userLessons').findOne({user_id:  ObjectID(lessonViewed.user_id), lesson_id:  ObjectID(lessonViewed.lesson_id)})
                if(userLesson){
                    if(userLesson.viewed !== lessonViewed.viewed){
                        await db.collection('userLessons').updateOne({_id : ObjectID(userLesson._id)}, {$set: {viewed: lessonViewed.viewed}})
                        userLesson = await db.collection('userLessons').findOne({_id : ObjectID(userLesson._id)})                 
                    }
                }else{
                    user = await db.collection('users').findOne({_id: ObjectID(lessonViewed.user_id)})
                    lesson = await db.collection('lessons').findOne({_id: ObjectID(lessonViewed.lesson_id)})
                    if(!user || !lesson){
                        throw new Error ('Not User or lesson found')
                    }
                    userLesson = await db.collection('userLessons').insertOne({user_id: ObjectID(lessonViewed.user_id),lesson_id: ObjectID(lessonViewed.lesson_id), viewed: lessonViewed.viewed })
                    userLesson? lessonViewed._id = userLesson.insertedId: new Error ('User Lesson Error')
                    userLesson = lessonViewed 
                }
            }
            catch(error){
                errorHandler(error)
            }
            return userLesson
        }
}