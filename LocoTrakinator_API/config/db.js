const mongoose = require('mongoose')      //mongoose work with models and schemas so you define how objectsyou store in the database should look like
                                          //and you create a model based on that which is just a javascript object in this model will have a couple of functions to do CRUD operations & ect.  
const dbConfig = require('./dbconfig')

const connectDB = async() => {
    try{
        const conn = await mongoose.connect(dbConfig.database,{                 //it will be using mongo client which is recomanded way when using mongoose 4.x.x
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useFindAndModify: false,
            useCreateIndex: true
        })                                    
        console.log("MongoDB DataBase is Connected to Cluster: %s",conn.connection.host)
    }
    catch (err){
        console.log(err) 
        process.exit(1)
    }
}

module.exports = connectDB