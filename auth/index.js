const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')


const secret = process.env.JWT_SECRET

function sign(payload){
    return jwt.sign(payload, secret)
}

function verify(token){
    return jwt.verify(token, secret)
}


module.exports={
    sign,
    verify
}