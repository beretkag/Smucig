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
                req.session.loggedUserStartCapital = results[0].startcapital;
                res.redirect('/main');
            }
        });
    }
});

router.post('/capitalmod/:from', (req, res)=>{
    if (req.body.startcapital == req.session.loggedUserStartCapital || req.body.startcapital < 0) {
        res.redirect(`/${req.params.from}`);
    } else {
        pool.query(`UPDATE users SET startcapital=? WHERE ID=?`, [req.body.startcapital, req.session.loggedUserID], (err) => {
            req.session.loggedUserStartCapital = req.body.startcapital;
            res.redirect(`/${req.params.from}`);
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

router.post('/profilmod', (req, res) => {
    let data = {
        newmail: req.body.newmail,
        newname: req.body.newname
    }
    if (data.newmail == null) {
        data.newmail = req.session.loggedUserMail;
    }
    if (data.newname == null) {
        data.newname = req.session.loggedUser;
    }
    if (data.newmail == '' || data.newname == '' || (data.newmail == req.session.loggedUserMail && data.newname == req.session.loggedUser)) {
        res.redirect('/profil');
    } else {
        pool.query(`SELECT ID FROM users WHERE name=? OR email=?`, [data.newname, data.newmail], (err, results) => {
            var mehet = true;
            for (let i = 0; i < results.length; i++) {
                if (results[i].ID != req.session.loggedUserID) {
                    mehet = false
                    res.redirect('/profil');
                }
            }
            pool.query(`UPDATE users SET name=?, email=? WHERE ID=?`, [data.newname, data.newmail, req.session.loggedUserID], (err) => {
                req.session.loggedUser = data.newname;
                req.session.loggedUserMail = data.newmail;
                res.redirect('/profil');
            });
        });
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
                res.redirect('/reg');
            } else {
                pool.query(`SELECT ID FROM users WHERE email=?`, [userdata.usermail], (err, results) => {
                    if (results.length > 0) {
                        res.redirect('/reg');
                    } else {
                        pool.query(`INSERT INTO users VALUES(null, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0)`, [userdata.username, userdata.usermail, sha1(userdata.userpass1)], (err) => {
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