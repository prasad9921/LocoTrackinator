const Teacher = require('../models/teacher');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const dbConfig = require('../config/dbconfig')
const cookieParser = require('cookie-parser')


// Handle Errors
const handleErrors = (err) => {
    console.log(err.message, err.code)     //error code is most of the times undefined you will use it in rare cases like, for unique email
    let errors = {email: '', password: ''};   //the error which we get is returned in json format 

    //incorrect email
    if (err.message === 'Incorrect Email'){
        errors.email = 'that email is not registered';
    }

    //incorrect password
    if (err.message === 'Incorrect Password'){
        errors.password = 'that password is incorrect';
    }

    //duplicate error code
    if(err.code === 11000) {
        errors.email = 'ID is already registered'
        return errors;
    }
    //validation errors
    if (err.message.includes('user validation failed'))    //(user validation failed: email: Please enter a valid email, password: min. password length of password is 6 characters undefined) => this is the error message if "user validation failed" is present then
    {
        Object.values(err.errors).forEach(({properties}) => {                             // in error msg we have errors array in which we have errors related to email and password differently we access them and get valuesso that we can know what is wrong and where to modify

            errors[properties.path] = properties.message;
        });          
    }                                       
    return errors;
}

const maxAge = 15*60;
const createToken = (id) => {          //in mongodb we have id that is taken as input
    return jwt.sign({ id }, dbConfig.secret, {
        expiresIn: maxAge           //expects time in seconds
    });
} 


module.exports.signup_get = (req, res) => {
    res.render('signup');
}

module.exports.signin_get = (req, res) => {
    res.render('signin');
}

module.exports.signup_post = async (req, res) => {         //to get data from json packet we need express json parser
    const {email, password } = req.body;
    const saltRounds = 12

    
    try {                                       // in try block we will insert data in database

        bcrypt.hash(password, saltRounds,async function(err, hash) { 
            const hashed_password = hash;   
            const teach__update = await Teacher.updateOne({ $and: [{ email: email}, {password: { $exists: false }}]}, {  password: hashed_password })     ////this is a async task this will return a "promise" and it must wait until promise is resolved and store data in a variable 
            
            if(teach__update.nModified == 0){
            //    res.json( {'error':'Password Not updated/ You are not Faculty'})
                teacher_element = await Teacher.find({email: email}).count()>0 ;
                if(teacher_element){
                    res.json({'passwordError': 'User Password already Modified'})
                }else{
                    res.json({'emailError': 'Faculty does not exist'})
                }        

            }  
            else{
                res.json({'passwordError':'Password Updated Successfully'})
            }
            
        });
        
    }
        
        
    catch (err) {
                                    // what ever function returns can be sent as json
            res.json({ err });
        
    }

}

module.exports.signin_post = async(req, res) => {
    const { email, password } = req.body;
    
    try{
        const teacher = await Teacher.login( email, password);
        
        console.log(teacher)
        if(teacher.auth){
            const token = createToken(teacher._id);
            res.cookie('jwt', token, { maxAge: maxAge*1000});
            res.status(200).json({ teacher: teacher.teacher })
         // res.send('teacherHome')
        }
        
    }
    catch(err){

        const errors = handleErrors(err);
        res.status(400).json({ errors });

    }
    
}

module.exports.logout_get = (req, res) => {                               //we need to delete jwt cookie
    res.cookie('jwt', '', { maxAge: 1})
    res.redirect('/');

}

