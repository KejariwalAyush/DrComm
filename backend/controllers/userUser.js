const userProfile = require('../models/userprofile')
const formatter = require('../utilities/formatter')
const firebaseOps = require('./firestoreOps')

exports.signup = (uid, data) => {
    return new Promise((resolve, refuse) => {
        const newUser = new userProfile({
            _id: uid,
            name: data.name,
            phno: data.phno,
            dob: data.dob,
            gender: data.gender,
            notificationToken: data.notificationToken
        })

        newUser.save()
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
        userProfile.findById(uid)
        .then(data => {
            resolve(formatter.userLongProfile(data))
        })
        .catch(err => {
            refuse(err)
        })
    })
}

exports.uploadDp = (uid, file) => {
    return new Promise((resolve, refuse) => {
        firebaseOps.uploadFile(file)
        .then(signedUrls => {
            userProfile.findByIdAndUpdate(uid, {
                dp: signedUrls[0]
            })
            .then(data => {
                resolve()
            })
            .catch(err => {
                refuse(err)
            })
        })
        .catch(err => {
            refuse(err)
        })
    })
}

exports.updateLocation = (uid, location) => {
    return new Promise((resolve, refuse) => {
        userProfile.findByIdAndUpdate(uid, {
            location: location
        })
        .then(data => {
            resolve()
        })
        .catch(err => {
            refuse(err)
        })
    })
}