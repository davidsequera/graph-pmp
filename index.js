'use strict'
const express = require('express')
const cors = require('cors')
const compression = require('compression')

require('dotenv').config()
const {graphql, buildSchema} = require('graphql')
const {makeExecutableSchema} = require('graphql-tools')
const gqlMiddleware = require('express-graphql')
const port = process.env.port || 8080

const {readFileSync} = require('fs')
const {join} = require('path')
const resolvers = require('./schema/resolvers')


const jwt = require('./auth/index')

const app = express()

app.use(compression());
app.use(cors())

const typeDefs = readFileSync(
    join(__dirname, 'schema', 'schema.gql'),
    'utf-8'
) 

const schema = makeExecutableSchema({typeDefs, resolvers})

app.use('/api', gqlMiddleware({
    schema: schema,
    rootValue: resolvers,
    graphiql: true
}))

// app.use(express.static(join(__dirname, 'build')))

// app.get('/*', function(req, res){ res.sendFile(join(__dirname, 'build', 'index.html'))})

app.listen(port, () =>{
    console.log(`Server is listening at http://localhost:${port}/api` )
})