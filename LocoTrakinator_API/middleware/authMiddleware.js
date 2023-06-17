//if we know what routes are present we can directly go to that page 
//so to stop that and to protect routes such that you can view routes only if
// 1. if your browser contains token & cookie then only you can access the routes 
//    else only login page will be loded and remaining routes cannot be accessed
//2. if jwt token is tampered or modified this routes are not to be accessed
// these are the 2 things we should be taking care of.

const jwt = require('jsonwebtoken');
const Teacher = require('../models/teacher');
const dbConfig = require('../config/dbconfig')

const requireAuth = (req, res, next) => {              //this middle ware is going to check the authentication status and apply this middleware to any route that requires authenticatiion  

    const token = req.cookies.jwt                       // the name of the cookie in browser is "jwt"

    //check json web token exists & is verified
    if(token) {
         jwt.verify(token, dbConfig.secret, (err, decodedToken) => {
             if (err) {
                 console.log(err.message);
                 res.redirect('/auth/signin');
             }
             else{
                 console.log(decodedToken);
                 next();
             }
         })
    }
    else {
        res.redirect('/auth/signin');
    }
}

// check current user
const checkUser = (req,res,next) => {
    const token = req.cookies.jwt;

    if(token){
        jwt.verify(token, dbConfig.secret, async (err, decodedToken) => {
            if (err) {
                console.log(err.message);
                res.locals.teacher = null; 
                next();
            }
            else{
                console.log(decodedToken);
                let teacher = await Teacher.findById(decodedToken.id);
                res.locals.teacher = teacher;              //to inject data into views we use locals
                next();
            }
        })
    }
    else{
        res.locals.teacher = null;
        next();
    }


}


module.exports = { requireAuth, checkUser };