const mongoose = require('mongoose')

const userprofileSchema = mongoose.Schema({
    _id: {
        type: String,
        required: true
    },
    name: {
        type: String,
        required: true
    },
    phno: {
        type: String,
        required: true
    },
    dob: {
        type: Date,
        required: true
    } ,
    gender: {
        type: String,
        required: true
    },
    location: {
        type: Object
    },
    notificationToken: {
        type: String
    },
    dp: {
        type: String,
        default: 'https://i.stack.imgur.com/l60Hf.png'
    }
})

const userprofile = mongoose.model('userprofile', userprofileSchema)
module.exports = userprofile