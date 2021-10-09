const router = require('express').Router()

router.use('/user', require('./user'))
router.use('/doctor', require('./doctors'))

module.exports = router