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

module.exports = router;