const router = require('express').Router()
const {isAuthenticated} = require('../../middlewares/auth')
const {verifyUser, generateToken} = require('../../controllers/login')
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

module.exports = router