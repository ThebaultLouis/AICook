const jwt = require('jsonwebtoken');
const secret = process.env.JWT_SECRET;

const authCheck = function (req, res, next) {
    if (req.headers.authorization) {
        console.log(req.headers.authorization)
        const token = req.headers.authorization;
        jwt.verify(token, secret, (err, decoded) => {
            if (err) {
                res.status(401)
                res.send({
                    "err": "Le token est mauvais"
                })
            } else {
                next();
            }
        });
    } else {
        res.sendStatus(401);
    }
}

module.exports = authCheck