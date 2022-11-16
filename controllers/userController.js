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
        req.app.locals.message = 'Some requested fields are empty!';
        req.app.locals.messagetype = 'danger';
        res.redirect('/');
    } else {
        pool.query(`SELECT * FROM users WHERE email=? AND passwd=?`, [userdata.usermail, sha1(userdata.userpass)], (err, results) => {
            if (results.length == 0) {
                req.app.locals.message = 'This account is not exits!';
                req.app.locals.messagetype = 'danger';
                res.redirect('/');
            } else {
                if (results[0].status == 0) {
                    req.app.locals.message = 'This account is banned!';
                    req.app.locals.messagetype = 'danger';
                    res.redirect('/');
                } else {
                    req.session.loggedIn = true;
                    req.session.loggedUserID = results[0].ID;
                    req.session.loggedUser = results[0].name;
                    req.session.loggedUserMail = results[0].email;
                    req.app.locals.message = 'You are successfully loged in!';
                    req.app.locals.messagetype = 'success';
                    res.redirect('/main');
                }
            }
        });
    }
});

module.exports = router;