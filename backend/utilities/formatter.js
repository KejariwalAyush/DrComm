const dateMod = require('../utilities/dateMod')

exports.doctorLongProfile = doc => {
    return {
        id: doc._id,
        name: doc.name,
        phno: doc.phno,
        certificate: doc.certificate,
        dp: doc.dp,
        gender: doc.gender,
        location: doc.location,
        specialization: doc.specialization,
        isActive: doc.isActive,
        homeVisit: doc.homeVisit,
        rating: doc.rating
    }
}

exports.userLongProfile = doc => {
    return {
        id: doc._id,
        name: doc.name,
        phno: doc.phno,
        gender: doc.gender,
        age: dateMod.getAge(doc.dob),
        dp: doc.dp,
        location: doc.location,
        notificationToken: doc.notificationToken
    }
}

exports.userShortProfile = doc => {
    return {
        id: doc._id,
        name: doc.name,
        location: doc.location,
        age: dateMod.getAge(doc.dob),
        dp: doc.dp
    }
}

exports.appointmentFormat = doc => {
    return {
        id: doc._id,
        appointmentType: doc.appointmentType,
        bookingDate: doc.bookingDate,
        appointmentDate: doc.appointmentDate
    }
}