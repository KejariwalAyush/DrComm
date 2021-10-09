const doctorProfile = require('../models/doctorprofile')
const formatter = require('../utilities/formatter')

exports.signup = (uid, data) => {
    return new Promise((resolve, refuse) => {
        const newDoctor = new doctorProfile({
            _id: uid,
            name: data.name,
            phno: data.phno,
            dob: data.dob,
            gender: data.gender,
            notificationToken: data.notificationToken
        })

        newDoctor.save()
        .then(data => {
            resolve(data)
        })
        .catch(err => {
            refuse(err)
        })
    })
}

exports.getFullProfile = uid => {
    return new Promise((resolve, refuse) => {
        doctorProfile.findById(uid)
        .then(data => {
            resolve(formatter.userLongProfile(data))
        })
        .catch(err => {
            refuse(err)
        })
    })
}