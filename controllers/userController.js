const express = require('express');
const config = require('../config.js');
const sha1 = require('sha1');
const ejs = require('ejs');
var mysql = require('mysql');
var pool = mysql.createPool(config.dbconfig);

const router = express.Router();

router.post('/login', (req, res) => {
    let userdata = {
        usermail: req.body.usermail,
        userpass: req.body.userpass
    }

    if (userdata.usermail == '' || userdata.userpass == '') {
        res.redirect('/');
    } else {
        pool.query(`SELECT * FROM users WHERE email=? AND passwd=?`, [userdata.usermail, sha1(userdata.userpass)], (err, results) => {
            if (results.length == 0) {
                res.redirect('/');
            } else {
                req.session.loggedIn = true;
                req.session.loggedUserID = results[0].ID;
                req.session.loggedUser = results[0].name;
                req.session.loggedUserMail = results[0].email;
                res.redirect('/main');
            }
        });
    }
});

router.post('/passmod', (req, res) => {
    let data = {
        oldpass: req.body.oldpass,
        newpass1: req.body.newpass1,
        newpass2: req.body.newpass2
    }
    if (data.oldpass == '' || data.newpass1 == '' || data.newpass2 == '') {
        res.redirect('/passmod');
    } else {
        if (data.newpass1 != data.newpass2) {
            res.redirect('/passmod');
        } else {
            if (data.oldpass == data.newpass1) {
                res.redirect('/passmod');
            } else {
                let pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
                if (!data.newpass1.match(pattern)) {
                    res.redirect('/passmod');
                } else {
                    pool.query(`SELECT passwd FROM users WHERE ID=?`, [req.session.loggedUserID], (err, results) => {
                        if (results[0].passwd != sha1(data.oldpass)) {
                            res.redirect('/passmod');
                        } else {
                            pool.query(`UPDATE users SET passwd=? WHERE ID=?`, [sha1(data.newpass1), req.session.loggedUserID], (err) => {
                                res.redirect('/passmod');
                            });
                        }
                    });
                }
            }
        }
    }
});

router.post('/reg', (req, res) => {
    let userdata = {
        username: req.body.username,
        usermail: req.body.usermail,
        userpass1: req.body.userpass1,
        userpass2: req.body.userpass2
    }
    if (userdata.usermail == '' || userdata.username == '' || userdata.userpass1 == '' || userdata.userpass2 == '') {
        res.redirect('/reg');
    } else {
        if (userdata.userpass1 != userdata.userpass2) {
            res.redirect('/reg');
        } else {
            let pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
            if (!userdata.userpass1.match(pattern)) {
                res.redirect('/passmod');
            } else {
                pool.query(`SELECT ID FROM users WHERE email=?`, [userdata.usermail], (err, results) => {
                    if (results.length > 0) {
                        res.redirect('/reg');
                    } else {
                        pool.query(`INSERT INTO users VALUES(null, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1)`, [userdata.username, userdata.usermail, sha1(userdata.userpass1)], (err) => {
                            if (err) {
                                console.log(err.sqlMessage);
                            }
                            res.redirect('/');
                        });
                    }
                });
            }
        }
    }

});

module.exports = router;