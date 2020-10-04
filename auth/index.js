const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')


const secret = process.env.JWT_SECRET

function sign(payload){
    return jwt.sign(payload, secret, {expiresIn: '60m'})
}

function verify(bearToken){
    let token = bearToken && bearToken.slice(7, bearToken.length).trimLeft()
    return jwt.verify(token, secret)
}


module.exports={
    sign,
    verify
}