const bcrypt = require('bcrypt')

const crypt = async (user) =>{
    user.password = await bcrypt.hash(user.password, 10)
}

const compare = async (token) =>{
     await bcrypt.compare(theUser.password, user.password)
}


module.exports={
    crypt,
    compare
}