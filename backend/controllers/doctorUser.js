const doctorProfile = require('../models/doctorprofile')
const firebaseOps = require('./firestoreOps')
const formatter = require('../utilities/formatter')

exports.signup = (uid, data) => {
    return new Promise((resolve, refuse) => {
        const newDoctor = new doctorProfile({
            _id: uid,
            name: data.name,
            phno: data.phno,
            gender: data.gender,
            specialization: data.specialization.toLowerCase(),
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
            if(data==null) {
                resolve(null)
            }
            else {
                resolve(formatter.doctorLongProfile(data))
            }
        })
        .catch(err => {
            refuse(err)
        })
    })
}

exports.uploadCertificate = (uid, file) => {
    return new Promise((resolve, refuse) => {
        firebaseOps.uploadFile(file)
        .then(signedUrls => {
            doctorProfile.findByIdAndUpdate(uid, {
                certificate: signedUrls[0]
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

exports.uploadDp = (uid, file) => {
    return new Promise((resolve, refuse) => {
        firebaseOps.uploadFile(file)
        .then(signedUrls => {
            doctorProfile.findByIdAndUpdate(uid, {
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
        doctorProfile.findByIdAndUpdate(uid, {
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

exports.updateisActive = (uid, act) => {
    return new Promise((resolve, refuse) => {
        doctorProfile.findByIdAndUpdate(uid, {
            isActive: act
        })
        .then(data => {
            resolve()
        })
        .catch(err => {
            refuse(err)
        })
    })
}

exports.updateHomeVisit = (uid, status) => {
    return new Promise((resolve, refuse) => {
        doctorProfile.findByIdAndUpdate(uid, {
            homeVisit: status
        })
        .then(data => {
            resolve()
        })
        .catch(err => {
            refuse(err)
        })
    })
}