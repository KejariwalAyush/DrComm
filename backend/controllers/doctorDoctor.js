const appointment = require('../models/appointment')
const userprofile = require('../models/userprofile')
const formatter = require('../utilities/formatter')

exports.getMyAppointments = uid => {
    return new Promise((resolve, refuse) => {
        appointment.find({
            doctorId: uid
        })
        .then(data => {
            Promise.all(data.map(item => {
                return new Promise((resolve, refuse) => {
                    userprofile.findById(item.userId)
                    .then(usr => {
                        let inf={appointment: formatter.appointmentFormat(item)}
                        inf.user=formatter.userLongProfile(usr)
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