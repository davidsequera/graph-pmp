const connectDB = require('../../store/db')
const { ObjectID } = require('mongodb')
const errorHandler = require('../errorHandler')
const bcrypt = require('bcrypt')



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