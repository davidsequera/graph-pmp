'use strict'

const connectDB = require('../../store/db')
const { ObjectID } = require('mongodb')
const errorHandler = require('../errorHandler')
const auth = require('../../auth')
const bcrypt = require('bcrypt')


module.exports ={
        courses: async () =>
        {
            let db
            let courses
            try {
                db = await connectDB()
                courses = await db.collection('courses').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return courses
        },
        course: async (root, {_id}) =>{
            let db
            let course
            try {
                db = await connectDB()
                course = await db.collection('courses').findOne({_id : ObjectID(_id)})
            } 
            catch (error){
                errorHandler(error)
            }
            return course
        },
        allChapters: async () =>{
            let db
            let chapters
            try {
                db = await connectDB()
                chapters = await db.collection('chapters').find().toArray()
                // chapters = await db.collection('chapters').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return chapters
        },
        chapters: async (root, {course_id}) =>{
                let db
                let chapters
                try {
                    db = await connectDB()
                    chapters = await db.collection('chapters').find({course_id : ObjectID(course_id)}).sort({_id : 1}).toArray()
                    // chapters = await db.collection('chapters').find().toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return chapters
        },
        chapter: async (root, {_id}) =>{
            let db
            let chapter
            try {
                db = await connectDB()
                chapter = await db.collection('chapters').findOne({_id : ObjectID(_id)})
                console.log(chapter._id)
                // chapter = await db.collection('chapter').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return chapter
        },        
        lessons: async (root, {id}) =>{
            let db
            let lessons
            try {
                db = await connectDB()
                lessons = await db.collection('lessons').find({chapter_id : ObjectID(id)}).toArray()
                // lessons = await db.collection('lessons').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return lessons
        },
        allLessons: async (root, {id}) =>{
            let db
            let lessons
            try {
                db = await connectDB()
                lessons = await db.collection('lessons').find().toArray()
                // lessons = await db.collection('lessons').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return lessons
        },
        lesson: async (root, {id}) =>{
            let db
            let lesson
            try {
                db = await connectDB()
                lesson = await db.collection('lessons').findOne({_id : ObjectID(id)})
                // lesson = await db.collection('lesson').find().toArray()
            } 
            catch (error){
                errorHandler(error)
            }
            return lesson
        },
        users: async () =>
        {
            let db
            let users
            try {
                db = await connectDB()
                users = await db.collection('users').find().toArray()
            } 
            catch (error){
            errorHandler(error)
                }
            return users
        },
        signIn: async (root, {input}) =>{
            if(!input.password || !input.email){
                errorHandler('Not email or password provided')
            }
            const defaults = {
                name: ''
            } 
            const theUser = Object.assign(defaults, input)
            let db
            let user
            let token = {}
            try{
                db = await connectDB()
                user = await db.collection('users').findOne({email: theUser.email})
                const pass = await bcrypt.compare(theUser.password, user.password)
                if (pass) {
                    token.body = auth.sign(user);
                    // Generar token;
                }
                
            }  
            catch (error){
                errorHandler(error)
            }
            return token
        }
}