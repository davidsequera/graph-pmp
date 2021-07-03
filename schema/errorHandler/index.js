'use strict'

function errorHandler(error, message){
    console.error(error)
    throw new Error (message || '404 Not Found')   
}

module.exports = errorHandler
