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
                    chapter = await query(`SELECT * FROM chapters WHERE course_id='${id}'`)
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
                    lesson = await query(`SELECT * FROM lessons WHERE chapter_id='${id}'`)
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
            courses: async ({courses, id}) =>{
                let course
                try {

                   course = await query(`
                   SELECT id,name,creation,SUM(userLessons) AS value,SUM(lessons) AS total FROM(SELECT courses.id,name,creation,NULL AS lessons,COUNT(*) AS userLessons FROM courses
                           INNER JOIN 
                           (SELECT chapters.id,chapters.course_id FROM chapters INNER JOIN
                               (SELECT lessons.id,lessons.chapter_id FROM lessons INNER JOIN  user_lessons ON lessons.id = user_lessons.lesson_id
                                   WHERE user_lessons.user_id = '${id}' AND user_lessons.viewed = 1
                               ) 
                               AS b ON chapters.id = b.chapter_id) 
                           AS a ON courses.id = a.course_id
                           GROUP BY id
                           UNION
                   SELECT courses.id,name,creation,COUNT(*) AS lessons, NULL AS userLesson FROM courses
                           INNER JOIN
                           (SELECT chapters.id,chapters.course_id FROM chapters INNER JOIN lessons ON chapters.id = lessons.chapter_id) 
                           AS A1 ON courses.id = A1.course_id
                           GROUP BY id) AS A2
                   GROUP BY A2.id  
                   `)

                } 
                catch (error){
                    errorHandler(error)
                }
                return course
            },
            lessons: async ({lessons, id}) =>{
                let viewed
                try {

                    viewed = await query(`SELECT * FROM user_lessons WHERE user_id='${id}'`)
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

