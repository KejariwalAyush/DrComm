const express = require('express')
const app = express()

app.get('/', (req, res) => {
    res.send('data')
})

module.exports = app