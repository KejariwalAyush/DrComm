require('dotenv').config()
const jwt = require('jsonwebtoken')

const JWT_SECRET = process.env.JWT_SECRET

exports.verify = (token) => {
    if (!token || !token.startsWith('Bearer')) {
        return null
    }

    if (!token.startsWith('Bearer')) {
        return null
    }

    const splitToken = token.split('Bearer ')

    if (!splitToken.length == 2) {
        return null
    }
    try {
        return jwt.verify(splitToken[1], JWT_SECRET)
    }
    catch {
        return null
    }
}