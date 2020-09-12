const connectDB = require('../../store/db')
const { ObjectID } = require('mongodb')
const errorHandler = require('../errorHandler/errorHandler')



module.exports ={
        createUser: async (root, {input}) =>{
            const defaults = {
                logo: ''
            } 
            const newRestaurant = Object.assign(defaults, input)
            let db
            let user
            try{
                db = await connectDB()
                user = await db.collection('users').insertOne(newRestaurant)
                // newRestaurant._id = restaurant.insertedId
            }
            catch(error){errorHandler(error)
            }
            return user
        },
        editUser: async (root, {id, input}) =>{
            let db
            let user
            try{
                db = await connectDB()
                await db.collection('users').updateOne({_id : ObjectID(id)}, {$set: input})
                user = await db.collection('users').findOne({_id : ObjectID(id)})
            }
            catch(error){errorHandler(error)
            }
            return user
        },
        deleteUser: async (root, {id}) =>{
            let db
            let user
            try{
                db = await connectDB()
                user = await db.collection('users').deleteOne(input)
            }
            catch(error){errorHandler(error)
            }
            return user
        },
}