'use strict'

const {MongoClient} = require('mongodb')

const {
    DB_USER,
    DB_PASS,
    DB_HOST,
    DB_NAME,
} = process.env


const mongoUri = `mongodb+srv://${DB_USER}:${DB_PASS}@${DB_HOST}.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`

let connection
async function connectDB () {
    if (connection) return connection
  
    let client
    try {
        client = await MongoClient.connect(mongoUri, {useNewUrlParser: true, useUnifiedTopology: true})
        connection = client.db(DB_NAME)
    } catch (error) {
        console.error('Could not connect to db', mongoUri, error)
        process.exit(1)
    }
  
    return connection
  }
  
  module.exports = connectDB