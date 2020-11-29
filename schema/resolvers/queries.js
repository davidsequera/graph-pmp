'use strict'

const connection = require('../../store/db')
const util = require('util')
const query = util.promisify(connection.query).bind(connection)


const errorHandler = require('../errorHandler')
const auth = require('../../auth')


module.exports ={
        verification: async (root,i ,req) =>{
            let user
            let token = req.headers.authorization
            if(!token){errorHandler('No Token Found')}
            let userInfo = auth.verify(token)
            console.log(userInfo)
            let {id} = userInfo
            try {
                user = await query(`SELECT * FROM users WHERE id=${id}`)
                user = await JSON.parse(JSON.stringify(user[0]))
                
                // user = await db.collection('users').findOne({_id : ObjectID(id)})
            } 
            catch (error){
                errorHandler(error)
            }
            return user

        },
        courses: async () =>
        {
            let courses
            try {
                courses = await query(`SELECT * FROM courses`)
            } 
            catch (error){
                errorHandler(error)
            }
            return courses
        },
        course: async (root, {id}) =>{
            let course
            try {
                course = await query(`SELECT * FROM courses WHERE id=${id}`)
                course = await course[0]
            } 
            catch (error){
                errorHandler(error)
            }
            console.log(course)
            return course
        },
        allChapters: async () =>{
            let chapters
            try {
                chapters = await query(`SELECT * FROM chapters`)
                // chapters = await db.collection('chapters').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return chapters
        },
        // allChapters: async () =>{
        //     let connection = await connectDB()
        //     return new Promise( (resolve, reject) => {
        //         connection.query(`SELECT * FROM chapters`, (err, data) => {
        //             if (err) return reject(err);
        //             resolve(data);
        //         })
        //     })
        // },
        chapters: async (root, {course_id}) =>{
                let chapters
                try {
                    chapters = await query(`SELECT * FROM chapters WHERE course_id=${course_id}`)

                    // chapters = await db.collection('chapters').find({course_id : ObjectID(course_id)}).sort({_id : 1}).toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return chapters
        },
        chapter: async (root, {id}) =>{
            let chapter
            try {

                chapter = await query(`SELECT * FROM chapters WHERE id=${id}`) 
                chapter = chapter[0]

                // chapter = await db.collection('chapters').findOne({_id : ObjectID(_id)})
            } 
            catch (error){
                errorHandler(error)
            }
            return chapter
        },        
        lessons: async (root, {id}) =>{
            let lessons
            try {
                lessons = await query(`SELECT * FROM lessons WHERE chapter_id=${id}`)
                // lessons = await db.collection('lessons').find({chapter_id : ObjectID(id)}).toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return lessons
        },
        allLessons: async (root, {id}) =>{
            let lessons
            try {
                lessons = await query(`SELECT * FROM lessons`)
                // lessons = await db.collection('lessons').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return lessons
        },
        lesson: async (root, {id}) =>{
            let lesson
            try {
                lesson = await query(`SELECT * FROM lessons WHERE id=${id}`)
                lesson = lesson[0]
                // lesson = await db.collection('lessons').findOne({_id : ObjectID(id)})
            } 
            catch (error){
                errorHandler(error)
            }
            return lesson
        },        
        user: async (root, args, req) =>{
            let user
            let token = req.headers.authorization
            if(!token){errorHandler('No Token Found')}
            let userInfo = auth.verify(token)
            console.log(userInfo)
            let {id} = userInfo
            try {
                user = await query(`SELECT * FROM users WHERE id=?`, id)
                user = await JSON.parse(JSON.stringify(user[0]))

                // user = await db.collection('users').findOne({_id : ObjectID(_id)})
            } 
            catch (error){
                errorHandler(error)
            }
            return user
        },
        users: async () =>
        {
            let users
            try {
                users = await query(`SELECT * FROM users`)
                // users = await db.collection('users').find().toArray()
            } 
            catch (error){
            errorHandler(error)
                }
            return users
        }
}