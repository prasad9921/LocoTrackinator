const mongoose = require('mongoose');
const { isEmail } = require('validator')

const studentSchema = new mongoose.Schema({
    name:{
        type: String,
    },
    id:{
        type: String,
        
    }, 
    branch:{
        type: String,
    },
    email:{
        type: String,
        lowercase: true,
        
    },
    location:{
        type: String,
    }
})

const Student = mongoose.model('student', studentSchema) // "user" it should be singular mongoose will make that word into plural and makes collection in database and stored data

module.exports = Student; // we use this model in our different controller functions to interact with user collection in database
                        // when ever you want to save or retrieve documents from database we use this moodel