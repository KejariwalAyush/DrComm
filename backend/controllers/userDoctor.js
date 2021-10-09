const appointment = require('../models/appointment')
const userprofile = require('../models/userprofile')
const doctorprofile = require('../models/doctorprofile')
const formatter = require('../utilities/formatter')

exports.createAppointment = (uid, data) => {
    return new Promise((resolve, refuse) => {
        const newAppointment = new appointment({
            appointmentType: data.appointmentType,
            bookingDate: new Date(),
            appointmentDate: data.appointmentDate,
            doctorId: data.doctorId,
            userId: uid
        })
    
        newAppointment.save()
        .then(data => {
            resolve(data)
        })
        .catch(err => {
            refuse(err)
        })
    })
}

exports.getNearbyDoctor = myuid => {
    return new Promise((resolve, refuse) => {
        userprofile.findById(myuid)
        .then(data => {
            doctorprofile.find({
                'location.postalCode': data.location.postalCode
            })
            .then(data => {
                Promise.all(data.map(item => {
                    return new Promise((resolve, refuse) => {
                        resolve(formatter.doctorLongProfile(item))
                    })
                }))
                .then(arr => {
                    resolve(arr)
                })
                .catch(err => {
                    refuse(err)
                })
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

exports.getNearbyDoctorAndQuery = (myuid, reqBody) => {
    return new Promise((resolve, refuse) => {
        userprofile.findById(myuid)
        .then(data => {
            reqBody['location.postalCode']=data.location.postalCode
            doctorprofile.find(reqBody)
            .then(data => {
                Promise.all(data.map(item => {
                    return new Promise((resolve, refuse) => {
                        resolve(formatter.doctorLongProfile(item))
                    })
                }))
                .then(arr => {
                    resolve(arr)
                })
                .catch(err => {
                    refuse(err)
                })
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

exports.getMyAppointments = myuid => {
    return new Promise((resolve, refuse) => {
        appointment.find({
            userId: myuid
        })
        .then(data => {
            Promise.all(data.map(item => {
                return new Promise((resolve, refuse) => {
                    doctorprofile.findById(item.doctorId)
                    .then(usr => {
                        let inf={appointment: formatter.appointmentFormat(item)}
                        inf.doctor=formatter.doctorLongProfile(usr)
                        resolve(inf)
                    })
                    .catch(err => {
                        refuse(err)
                    })
                })
            }))
            .then(arr => {
                resolve(arr)
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