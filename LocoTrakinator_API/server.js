const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const connectDB = require('./config/db')
const passport = require('passport')
const bodyParser = require('body-parser')
const routes = require('./routes/allroutes')

connectDB()

const app = express()

if(process.env.NODE_ENV === 'development'){
    app.use(morgan('dev'))                             //send every requet through morgan to print logs in terminal for analysis so we write this statement above routes
}



app.use(cors()) 
app.use(bodyParser.urlencoded({ extended: false }))     // used for extracting url encoded data//if extended is true, when rich data is passed through it when simple data is passed it is set to false
app.use(bodyParser.json())                              //used for extracting json data and make it easily readable


//course header handling
//with these below setup we shouldnt encounter any course errorswhen you connect a single page application or some avg. client to our API
app.use((req, res, next) =>{
    res.header('Access-Control-Allow-Origin', '*');  //anyone can access this api
  //res.header('Access-Control-Allow-Origin', 'http://mycool.com');  //if you want to give access to particular website 
   // res.header('Access-Control-Allow-Headers','*')  //which type of errors you want to accept, which headers can be ent along with requests
    res.header('Access-Control-Allow-Headers','Origin, X-Requested-With, Content-Type, Accept, Authorization');   //all these headers can be appended for incomming request(w.r.t server)
    if(req.method === 'OPTIONS'){   //browser will always send an options request 1st when you send POST or PUT request for knowing whether it can do the particular request or not 
        res.header('Access-Control-Allow-Method','PUT, POST, PATCH', 'DELETE, GET')
        return res.status.json({})
    }
    next()    //if you dont write next() requestwill be blocked here
})


app.use(routes)


const PORT = process.env.PORT || 3000

app.listen(PORT, console.log("Server running in %s mode on port %d",process.env.NODE_ENV,PORT))