const router = require('express').Router()
const {isAuthenticated} = require('../../middlewares/auth')
const { upload, verifyUser, generateToken } = require('../../controllers/firestoreOps')
const userUserController = require('../../controllers/userUser')

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
        console.log(failure)
       return res.status(404).json({
           success: false,
            message: 'LOGIN FAILURE: user not found'
       })
    })
})

router.post('/signup', isAuthenticated, (req, res) => {
    const body = req.body
    if(!body.name || !body.phno || !body.dob || !body.gender || !body.notificationToken) {
        res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: required name, phno, dob, gender, notificationToken'
        })
    }
    else {
        userUserController.signup(req.uid, req.body)
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
    userUserController.getFullProfile(req.uid)
    .then(data => {
        res.json(data)
    })
    .catch(err => {
        res.sendStatus(500)
    })
})

router.post('/uploadDp', isAuthenticated, upload.single('file'), (req, res) => {
    userUserController.uploadDp(req.uid, req.file)
    .then(() => {
        res.json({
            success: true,
            message: 'display picture uploaded'
        })
    })
})

router.post('/setLocation', isAuthenticated, (req, res) => {
    if(!req.body.location) {
        return res.status(400).json({
            success: false,
            message: 'PARAMETER ERROR: expected location as object'
        })
    }
    else {
        userUserController.updateLocation(req.uid, req.body.location)
        .then(() => {
            res.json({
                success: true,
                message: 'location updated'
            })
        })
    }
})

module.exports = router