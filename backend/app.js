const express = require('express')
const app = express()

app.use(express.json())
// app.use(require('./middlewares/cors'))
app.use('/static', express.static('static'))

app.use('/api/doctor', require('./router/doctor/api'))
app.use('/api/user', require('./router/user/api'))

module.exports = app