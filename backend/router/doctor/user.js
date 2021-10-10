const router = require('express').Router()
const {isAuthenticated} = require('../../middlewares/auth')
const { upload, verifyUser, generateToken } = require('../../controllers/firestoreOps')
const doctorUserController = require('../../controllers/doctorUser')

router.post('/login', (req, res) => {
    if(!req.body.phno || !req.body.uid) {
        return res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: phno and uid required in json format'
        })
    }

    //verify the user from the firebase if verified generate jwt token
    verifyUser(req.body.phno, req.body.uid)
    .then(success => {
        if(success) {
            return res.json({
                success: success,
                token: generateToken(req.body.uid)
            })
        } else {
            return res.json({
                success: success,
                message: 'LOGIN FAILURE: uid and phone number donot match'
            })
        }
    })
    .catch(failure => {
       return res.status(404).json({
           success: false,
            message: 'LOGIN FAILURE: user not found'
       })
    })
})

router.post('/signup', isAuthenticated, (req, res) => {
    const body = req.body
    if(!body.name || !body.phno || !body.gender || !body.specialization || !body.notificationToken) {
        res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: required name, phno, gender, specialization, notificationToken'
        })
    }
    else {
        doctorUserController.signup(req.uid, body)
        .then(data => {
            res.send(data)
        })
        .catch(err => {
            console.log(err)
            res.sendStatus(500)
        })
    }
})

router.get('/getMyProfile', isAuthenticated, (req, res) => {
    doctorUserController.getFullProfile(req.uid)
    .then(data => {
        res.json(data)
    })
    .catch(err => {
        console.log(err)
        res.sendStatus(500)
    })
})

router.post('/uploadCertificate', isAuthenticated, upload.single('avatar'), (req, res) => {
    doctorUserController.uploadCertificate(req.uid, req.file)
    .then(() => {
        res.json({
            success: true,
            message: 'certificate uploaded'
        })
    })
})

router.post('/uploadDp', isAuthenticated, upload.single('avatar'), (req, res) => {
    doctorUserController.uploadDp(req.uid, req.file)
    .then(() => {
        res.json({
            success: true,
            message: 'display picture uploaded'
        })
    })
})

router.post('/setLocation', isAuthenticated, (req, res) => {
    doctorUserController.updateLocation(req.uid, req.body)
    .then(() => {
        res.json({
            success: true,
            message: 'location updated'
        })
    })
})

router.post('/setIsActive', isAuthenticated, (req, res) => {
    if(typeof(req.body.isActive)!=='boolean') {
        return res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: expected isActive as boolean'
        })
    }
    else {
        doctorUserController.updateisActive(req.uid, req.body.isActive)
        .then(() => {
            res.json({
                success: true,
                message: 'active status updated'
            })
        })
    }
})

router.post('/setHomeVisit', isAuthenticated, (req, res) => {
    if(typeof(req.body.homeVisit)!=='boolean') {
        return res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: expected homeVisit as boolean'
        })
    }
    else {
        doctorUserController.updateHomeVisit(req.uid, req.body.homeVisit)
        .then(() => {
            res.json({
                success: true,
                message: 'homeVisit status updated'
            })
        })
    }
})

module.exports = router