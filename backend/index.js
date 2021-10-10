const mongoose = require('mongoose')
const http = require('./app')
require('dotenv').config()

const PORT = process.env.PORT || 5000
const DB_URI = process.env.DB_URI

mongoose.connect(DB_URI, {useNewUrlParser: true, useUnifiedTopology: true})
const db = mongoose.connection

db.on('open', () => {
    http.listen(PORT, () => {
        console.log(`Server listening at PORT ${PORT}`)
    })
})

db.on('error', () => {
    console.error('Database connection failed\nServer not started')
})