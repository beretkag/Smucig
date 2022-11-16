const express = require('express');
const config = require('../config.js');
const moment = require('moment');
const ejs = require('ejs');
var mysql = require('mysql');
var pool = mysql.createPool(config.dbconfig);

const router = express.Router();

module.exports = router;