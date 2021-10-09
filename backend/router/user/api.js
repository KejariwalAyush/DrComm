const router = require('express').Router()

router.use('/user', require('./user'))

module.exports = router