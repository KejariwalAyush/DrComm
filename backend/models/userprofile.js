const mongoose = require('mongoose')

const userprofileSchema = mongoose.Schema({
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
        type: String
    }
})

const userprofile = mongoose.model('userprofile', userprofileSchema)
module.exports = userprofile