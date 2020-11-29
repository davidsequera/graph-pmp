'use strict'

const connection = require('../../store/db')
const util = require('util')
const query = util.promisify(connection.query).bind(connection)

const errorHandler = require('../errorHandler')

module.exports ={
        course:
        {
            chapters: async ({chapters, id}) =>{
                let chapter
                try {
                    chapter = await query(`SELECT * FROM chapters WHERE course_id=${id}`)
                    // chapter = await db.collection('chapters').find({course_id : _id}).toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return chapter
            }

        },
        chapter:
        {
            lessons: async ({lessons, id}) =>{
                let lesson
                try {
                    lesson = await query(`SELECT * FROM lessons WHERE chapter_id=${id}`)
                    // lesson = await db.collection('lessons').find({chapter_id: ObjectID(_id)}).sort({"_id": 1}).toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return lesson
            }

        },
        user:
        {
            lessons: async ({lessons, id}) =>{
                let viewed
                try {

                    viewed = await query(`SELECT * FROM user_lessons WHERE user_id=${id}`)
                    // viewed = await db.collection('userLessons').find({ user_id: ObjectID(_id)}, {lesson_id: 1}).toArray()
                    // lesson = await db.collection('lessons').find({ user_id: { $in: viewed } }).toArray()
                } 
                catch (error){
                    errorHandler(error)
                }
                return viewed
            }
        }
}

