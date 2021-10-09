const mongoose = require('mongoose')

const doctorprofileSchema = mongoose.Schema({
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
    gender: {
        type: String,
        required: true
    },
    certificate: {
        type: String
    },
    dp: {
        type: String
    },
    location: {
        type: Object
    },
    specialization: {
        type: String,
        required: true
    },
    isActive: {
        type: Boolean,
        default: false
    },
    homeVisit: {
        type: Boolean,
        default: false
    },
    rating: {
        type: Number,
        default: 0
    },
    notificationToken: {
        type: String,
        required: true
    }
})

const doctorprofile = mongoose.model('doctorprofile', doctorprofileSchema)
module.exports = doctorprofile