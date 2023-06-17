const express = require('express')
const router = express.Router()
const Teacher = require('../models/teacher');
const Student = require('../models/student');
const Manager = require('../models/manager');


const {MongoClient} = require('mongodb');

module.exports.student = async (req, res, next) => {
    res.render('student')
}

module.exports.management = async (req,res,next) => {
    res.render('management')
}
module.exports.teacher = async (req, res, next) => {
    res.render('teacher')
}

module.exports.mddata = async (req, res, next) => {
    
    const searchid = req.query.id;

    try{

        const teachers = await Teacher.find({id: {$regex: searchid,$options: '$i'}})
        const managers = await Manager.find({id: {$regex: searchid,$options: '$i'}})
        const students = []
        res.json( { 
            teachers: teachers ,
            managers: managers,
            students: students
        });
    }
    catch(err){
        res.status(400).json({ err });
    }
}

module.exports.mddata_teacher = async (req, res, next) => {
    
    const searchid = req.query.id;

    try{

        const teachers = await Teacher.find({id: {$regex: searchid,$options: '$i'}})
        const managers = await Manager.find({id: {$regex: searchid,$options: '$i'}})
        const students = await Student.find({id: {$regex: searchid,$options: '$i'}})
        res.json({teachers: teachers,
                  managers: managers,
                  students: students
            });
    }
    catch(err){
        res.status(400).json({ err });
    }
}


module.exports.display = async (req, res, next) => {
    const searchid = req.body.id;

    try{
        
        const teachers = await Teacher.find({id: {$regex: searchid,$options: '$i'}})
        const managers = await Manager.find({id: {$regex: searchid,$options: '$i'}})
        const students = []
        res.json( { 
            teachers: teachers ,
            managers: managers,
            students: students
        });
        
        
    }
    catch(err){
        
        res.status(400).json({ err });
        
    }

}

module.exports.teacher_display = async (req, res, next) => {
    const searchid = req.body.id;

    try{
        
        const teachers = await Teacher.find({id: {$regex: searchid,$options: '$i'}})
        const managers = await Manager.find({id: {$regex: searchid,$options: '$i'}})
        const students = await Student.find({id: {$regex: searchid,$options: '$i'}})
        
        res.json( { 
            teachers: teachers ,
            managers: managers,
            students: students
        });
        
        
    }
    catch(err){
        
        res.status(400).json({ err });
        
    }

}


module.exports.update_location = async (req, res, next) => {
    
    const {id,location} = req.body;

    try{
        const location_update = await Teacher.updateOne( { id: id}, {  location: location })  
        res.send('updated')

    }
    catch(err){
        res.status(400).json({ err });
    }
}



