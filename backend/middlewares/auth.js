const jwt = require('../controllers/jwt')
exports.isAuthenticated = (req, res, next) => {
    const { authorization } = req.headers
    
    uid=jwt.verify(authorization)
    if(uid==null) {
        res.status(401).json({ status: 401, message: 'Unauthorized' })
        return 
    }

    req.uid=uid
    next()
}