
module.exports = {
    api:{
        port: process.env.PORT || 3000
    },
    jwt:{
        secret: process.env.JWT_SECRET || 'megustaunaloca'
    },
    mysql: {
        host: process.env.MYSQL_HOST || 'remotemysql.com',
        user: process.env.MYSQL_USER || 'IDajWC8Bxi',
        password: process.env.MYSQL_PASS || 'BXNtbZvVyf',
        database: process.env.MYSQL_DB || 'IDajWC8Bxi',
    }
}