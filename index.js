'use strict'
const express = require('express')
const cors = require('cors')
const compression = require('compression')

require('dotenv').config()
const {graphql, buildSchema} = require('graphql')
const {makeExecutableSchema} = require('graphql-tools')
const gqlMiddleware = require('express-graphql')
const port = process.env.port || 8080

const {readFileSync, statSync, createReadStream} = require('fs')
const {join} = require('path')
const resolvers = require('./schema/resolvers')
 


const app = express()

app.use(compression());
app.use(cors())

app.get(/\/video\/.*/, function(req, res){
    // Ensure there is a range given for the video
    const range = req.headers.range;
    if (!range) {
      res.status(400).send("Requires Range header");
    }
    
  
    // get video stats (about 61MB)
    const absolutePath = "D:\\videos\\"
    const videoPath = (decodeURIComponent(req.url)).slice(7).replace("%20", " ");
    const videoSize = statSync(absolutePath+videoPath).size;
  
    // Parse Range
    // Example: "bytes=32324-"
    const CHUNK_SIZE = 10 ** 6; // 1MB
    const start = Number(range.replace(/\D/g, ""));
    const end = Math.min(start + CHUNK_SIZE, videoSize - 1);
  
    // Create headers
    const contentLength = end - start + 1;
    const headers = {
      "Content-Range": `bytes ${start}-${end}/${videoSize}`,
      "Accept-Ranges": "bytes",
      "Content-Length": contentLength,
      "Content-Type": "video/mp4",
    };
  
    // HTTP Status 206 for Partial Content
    res.writeHead(206, headers);
  
    // create video read stream for this particular chunk
    const videoStream = createReadStream(absolutePath+videoPath, { start, end });
  
    // Stream the video chunk to the client
    videoStream.pipe(res);
})

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