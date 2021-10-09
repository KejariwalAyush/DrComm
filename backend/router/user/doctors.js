const { isAuthenticated } = require('../../middlewares/auth')
const userDoctorContorller = require('../../controllers/userDoctor')
const router = require('express').Router()

router.post('/requestAppointement', isAuthenticated, (req, res) => {
    if(!req.body.appointmentType || !req.body.appointmentDate || !req.body.doctorId) {
        return res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: required appointmentType, appointmentDate, doctorId'
        })
    }
    userDoctorContorller.createAppointment(req.uid, req.body)
    .then(data => {
        res.json(data)
    })
    .catch(err => {
        res.sendStatus(500)
    })
})

router.get('/getNearByDoctor', isAuthenticated, (req, res) => {
    userDoctorContorller.getNearbyDoctor(req.uid)
    .then(data => {
        return res.json(data)
    })
    .catch(err => {
        console.log(err)
        return res.sendStatus(500)
    })
})

router.post('/queryNearByDoctor', isAuthenticated, (req, res) => {
    userDoctorContorller.getNearbyDoctorAndQuery(req.uid, req.body)
    .then(data => {
        return res.json(data)
    })
    .catch(err => {
        console.log(err)
        return res.sendStatus(500)
    })
})

router.get('/getMyAppointments', isAuthenticated, (req, res) => {
    userDoctorContorller.getMyAppointments(req.uid)
    .then(data => {
        res.json(data)
    })
    .catch(err => {
        console.log(err)
        res.sendStatus(500)
    })
})

module.exports = router