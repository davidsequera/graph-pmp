'use strict'

function errorHandler(error){
    console.error(error)
    throw new Error ('Error 404 Not Found')   
}

module.exports = {
    errorHandler
}