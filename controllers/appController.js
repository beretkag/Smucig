const express = require('express');
const moment = require('moment');
const ejs = require('ejs');
const config = require('../config.js');
const mysql = require('mysql');
var pool = mysql.createPool(config.dbconfig);

const router = express.Router();

router.get('/', (req, res) => {
    ejs.renderFile('views/index.ejs', { app: config.appconfig }, (err, data) => {
        res.send(data);
    });
});

router.get('/reg', (req, res) => {
    ejs.renderFile('views/registration.ejs', { app: config.appconfig }, (err, data) => {
        req.app.locals.isMessage = false;
        res.send(data)
    });
});

router.get('/main', (req, res) => {
    if (req.session.loggedIn) {
        ejs.renderFile('views/main.ejs', { app: config.appconfig, err: req.app.locals, user: req.session }, (err, data) => {
            res.send(data)
        });
    } else {
        res.redirect('/');
    }
});

router.get('/profil', (req, res) => {
    if (req.session.loggedIn) {
        ejs.renderFile('views/profil.ejs', { app: config.appconfig, user: req.session }, (err, data) => {
            res.send(data)
        });
    } else {
        res.redirect('/');
    }
});

router.get('/passmod', (req, res) => {
    if (req.session.loggedIn) {
        ejs.renderFile('views/passmod.ejs', { app: config.appconfig, err: req.app.locals, user: req.session }, (err, data) => {
            res.send(data)
        });
    } else {
        res.redirect('/');
    }
});

router.get('/logout', (req, res) => {
    req.session.loggedIn = false;
    req.session.loggedUserID = null;
    req.session.loggedUser = null;
    req.session.loggedUserMail = null;
    ejs.renderFile('views/index.ejs', { app: config.appconfig }, (err, data) => {
        res.send(data)
    });
});

module.exports = router;