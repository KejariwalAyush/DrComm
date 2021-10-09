const mongoose = require('mongoose')

const appointmentSchema = mongoose.Schema({
    appointmentType: {
        type: String,
        required: true
    },
    bookingDate: {
        type: Date,
        required: true
    },
    appointmentDate: {
        type: Date,
        required: true
    },
    doctorId: {
        type: String,
        required: true
    },
    userId: {
        type: String,
        required: true
    }
})

const apppointment = mongoose.model('appointment', appointmentSchema)
module.exports = apppointment