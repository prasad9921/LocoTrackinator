const mongoose = require('mongoose');
const { isEmail } = require('validator');
const bcrypt = require('bcrypt');
//schema tells us how data is to be there in data base

const teacherSchema = new mongoose.Schema({
    name:{
        type: String,
    },
    id:{
        type: String,
    }, 
    branch:{
        type: String,
    },
    changedpass:{
        type: Boolean,
    },
    email:{
        type: String,
        required: [true, 'Please enter an Email'],
        unique: true,
        lowercase: true,
        validate: [isEmail, 'Please enter a valid email']
        
    },
    location:{
        type: String,
    },
    password: {
        type: String,
        required: [true, 'Please enter an Password'],
        minlength: [6, 'min. password length of password is 6 characters']
    }
})

// static method to login user
teacherSchema.statics.login = async function(email, password){
    const teacher = await this.findOne({ email: email });            //find user
  //  console.log(teacher)
    if(teacher) {
      const auth = await bcrypt.compare(password, teacher.password)
      teacher.password = ''
      if(auth){
            data = {auth,teacher}
        return data
      }
      throw Error('Incorrect Password')
    }
    throw Error('Incorrect Email')
  }



const Teacher = mongoose.model('teacher', teacherSchema) // "teacher" it should be singular mongoose will make that word into plural and makes collection in database and stored data

module.exports = Teacher; // we use this model in our different controller functions to interact with user collection in database
                        // when ever you want to save or retrieve documents from database we use this moodel