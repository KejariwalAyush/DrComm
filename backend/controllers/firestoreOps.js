const saltedMd5 = require('salted-md5')
const admin = require("firebase-admin");
const path = require('path')
const jwt = require('jsonwebtoken')
const multer = require('multer')
require('dotenv').config()

const JWT_SECRET = process.env.JWT_SECRET
const serviceAccount = require('../service-account.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: process.env.BUCKET_URL
});

const bucket = admin.storage().bucket()

exports.upload = multer({
  storage: multer.memoryStorage()
})

exports.uploadFile = file => {
    const name = saltedMd5(file.originalname, process.env.MD5_SALT)
    const filename = name+path.extname(file.originalname)
    bucket.file(filename).createWriteStream().end(file.buffer)
    let f= bucket.file(filename)
    return f.getSignedUrl({
      action: 'read',
      expires: '03-09-2491'
    })
}


exports.verifyUser = (phno, uid) => {
    return new Promise((resolve, refuse) => {
        admin.auth().getUserByPhoneNumber(phno)
            .then(user => {
                if(user.uid===uid) {
                    resolve(true)
                }
                else {
                  resolve(false)
                }
            })
            .catch(err => {
                console.log(err)
                refuse(false)
            })
    })
}

exports.generateToken = (uid) => {
    return jwt.sign(uid, JWT_SECRET)
}