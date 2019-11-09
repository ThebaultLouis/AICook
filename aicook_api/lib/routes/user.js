const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();
const jwt = require('jsonwebtoken');

var authCheck = require('../middlewares/authCheck');

var {
    User
} = require('../models/user')

router.post('/login', async (req, res) => {
    const secret = process.env.JWT_SECRET;
    const userName = req.body.userName;
    const password = req.body.password;

    if (!userName || !password) {
        return res.status(401).send({
            error: 'User name and password required'
        })
    }
    User.findOne({
            userName
        })
        .then(async (user) => {
            if (!user) {
                res.status(401);
                return res.send({
                    "error": "L'utilisateur n'existe pas"
                });
            }
            try {
                const isTheGoodPaswword = await bcrypt.compare(password, user.hashedPassword);

                if (isTheGoodPaswword) {
                    const token = jwt.sign({
                            data: {
                                userName,
                                userId: user.id
                            }
                        },
                        secret, {
                            expiresIn: 60 * 60
                        }
                    );
                    return res.send({
                        'token': token
                    });
                } else {
                    res.status(401);
                    return res.send({
                        "error": 'Invalid username or password'
                    });
                }
            } catch (ex) {
                // logger.error(ex);
                res.status(401);
                return res.send({
                    "error": 'Invalid username or password'
                });
            }
        }).catch(e => {
            res.status(401);
            return res.send({
                error: 'Invalid username or password'
            });
        })
});

router.post('/signup', async (req, res) => {
    const userName = req.body.userName;
    const email = req.body.email;
    const password = req.body.password;
    try {
        const hashedPassword = await bcrypt.hash(password, 10)
        var user = new User({
            userName,
            email,
            hashedPassword
        })
        user.save().then(user => {
            res.send({
                "user": user
            })
        }).catch(e => {
            res.status(400)
            res.send({
                "err": e
            })
        })

    } catch (ex) {
        // logger.error(ex);
        res.status(400);
        return res.send({
            error: ex
        });
    }
});
router.put('/updateUser', authCheck, async (req, res) => {
    const userName = req.body.userName;
    const email = req.body.email;
    const token = req.headers.authorization;
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const userId = decoded.data.userId;


    options = {
        new: true,
    };

    try {
        User.findByIdAndUpdate(userId, {
            "userName": userName,
            "email": email
        }, options).then(user => {
            res.send({
                "user": user,
                "message": 'User created'
            });
        }).catch(e => {
            res.status(400)
            console.log(e)
            res.send({
                "err": e
            })
        })

    } catch (ex) {
        // logger.error(ex);
        res.status(400);
        return res.send({
            error: ex
        });
    }
});
router.put('/updatePassword', authCheck, async (req, res) => {
    const token = req.headers.authorization;
    const password = req.body.password;
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const userId = decoded.data.userId;
    try {
        const hashedPassword = await bcrypt.hash(password, 10)
        await User.update({
            hashedPassword
        }, {
            where: {
                id: userId
            }
        })
        return res.send({
            message: 'User created'
        });
    } catch (ex) {
        logger.error(ex);
        res.status(400);
        return res.send({
            error: ex
        });
    }
});
module.exports = router;