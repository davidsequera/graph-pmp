'use strict'

const connectDB = require('../../store/db')
const { ObjectID } = require('mongodb')
const errorHandler = require('../errorHandler/errorHandler')


module.exports ={
        course:
        {
            chapters: async ({chapters, _id}) =>{
                let db
                let chapter
                let locIDS
                try {
                    db = await connectDB()
                    chapter = await db.collection('chapters').find({course_id : _id}).toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return chapter
            }

        },
        chapter:
        {
            lessons: async ({lessons, _id}) =>{
                let db
                let lesson
                try {
                    db = await connectDB()
                    lesson = await db.collection('lessons').find({chapter_id: ObjectID(_id)}).sort({"_id": 1}).toArray()
                    // lesson = await db.collection('lessons').find().sort({"_id": 1}).toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return lesson
            }

        }
}