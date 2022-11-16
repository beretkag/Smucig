const express = require('express');
const session = require('express-session');
const path = require('path');
const config = require('./config.js');
const app = express();

const appController = require('./controllers/appController.js');
const userController = require('./controllers/userController.js');
const filleresController = require('./controllers/filleresController.js');

app.use(express.urlencoded({ extended: true }));
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

app.use('/assets', express.static(path.join(__dirname + '/assets')));
app.use('/views', express.static(path.join(__dirname + '/views')));


app.use('/', appController);
app.use('/users', userController);
app.use('/filleres', filleresController);


app.listen(config.appconfig.port, ()=>{
    console.log(`A szerver ezen a porton hallgat: ${config.appconfig.port}...`);
});