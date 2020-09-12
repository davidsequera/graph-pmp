'use strict'
const express = require('express')
const cors = require('cors')

require('dotenv').config()
const {graphql, buildSchema} = require('graphql')
const {makeExecutableSchema} = require('graphql-tools')
const gqlMiddleware = require('express-graphql')
const port = process.env.port || 8080

const {readFileSync} = require('fs')
const {join} = require('path')
const resolvers = require('./schema/resolvers/resolvers')

const app = express()

app.use(cors())

const typeDefs = readFileSync(
    join(__dirname, 'schema', 'schema.gql'),
    'utf-8'
) 

const schema = makeExecutableSchema({typeDefs, resolvers})


app.use('/', gqlMiddleware({
    schema: schema,
    rootValue: resolvers,
    graphiql: true
}))

app.listen(port, () =>{
    console.log(`Server is listening at http://localhost:${port}` )
})