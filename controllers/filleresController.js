const express = require('express');
const config = require('../config.js');
const moment = require('moment');
const ejs = require('ejs');
var mysql = require('mysql');
var pool = mysql.createPool(config.dbconfig);

const router = express.Router();

router.post('/income', (req, res) => {
    let data = {
        amount: req.body.amount,
        date: moment(req.body.date).format('YYYY-MM-DD'),
        type: req.body.type
    };
    if (data.amount <= 0 || data.amount == '' || data.date == '') {
        res.redirect('/income');
    } else {
        pool.query(`INSERT INTO records VALUES(null, ?, 0, ?, ?, null, ?)`, [req.session.loggedUserID, data.amount, data.type, data.date], (err) => {
            if (err) {
                console.log(err.sqlMessage);
            }
            res.redirect('/income');
        });
    }
});

router.post('/expenditure', (req, res) => {
    let data = {
        amount: req.body.amount,
        date: moment(req.body.date).format('YYYY-MM-DD'),
        type: req.body.type
    };
    if (data.amount <= 0 || data.amount == '' || data.date == '') {
        res.redirect('/income');
    } else {
        pool.query(`INSERT INTO records VALUES(null, ?, 1, ?, null, ?, ?)`, [req.session.loggedUserID, data.amount, data.type, data.date], (err) => {
            if (err) {
                console.log(err.sqlMessage);
            }
            res.redirect('/expenditure');
        });
    }
});




module.exports = router;