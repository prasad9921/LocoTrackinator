const express = require('express');
const app = express();
const router = express.Router();
const mongoose = require('mongoose');
const cookieParser = require('cookie-parser')


const authroutes = require('./AuthRoutes');
const msfroutes = require('./msfRoutes');


app.use(express.static('public'));
app.use(express.json());          //it takes any json data that comes along with request and passes into a java scipt object so that we can use inside code
app.use(cookieParser());

// view engine
app.set('view engine', 'ejs');

//routes which handle requests 

app.get('/', (req, res) => res.render('index'));
app.use('/auth', authroutes);
app.use('/msf', msfroutes);


//if requests are not handled by above routes error should be handled and msg is to be displayed 
//the below error handler handles only error if request is not handled and sends error as output (doesn't handle data base errors) 
app.use((req, res, next) => {
    const error = new Error('Not Found')
    error.status = 404;
    next(error);
})

app.use((error,req,res,next) => {
    res.status(error.status || 500);
    res.json({
        error:{
            message: error.message
        }
    })
})


module.exports = router; 
module.exports = app;