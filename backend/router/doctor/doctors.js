const { isAuthenticated } = require('../../middlewares/auth')
const doctorDoctorController = require('../../controllers/doctorDoctor')
const router = require('express').Router()

router.get('/myAppointments', isAuthenticated, (req, res) => {
    doctorDoctorController.getMyAppointments(req.uid)
    .then(data => {
        return res.json(data)
    })
    .catch(err => {
        console.log(err)
        return res.sendStatus(500)
    })
})

module.exports = router