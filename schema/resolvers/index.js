'use strict'


const Mutation = require('./mutations')
const Query = require('./queries')
const types = require('./types')

const resolvers = {
    Query,
    Mutation,
    ...types
}

module.exports = resolvers