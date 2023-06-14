const express = require('express')
const mysql = require("mysql")
const app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
function isInteger(str){
    return Number.isInteger(Number(str));
}
var dbConfig = {
    host:'localhost',
    user:'root',
    password:'delta@sql',
    database:'passwd'
}
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'delta@sql',
    database: 'passwd'
})
app.set('view engine','ejs')
db.connect((error)=>{
    if(error){
        console.log(error)
    } else{
        console.log("Connected bro")
    }
})
app.get('/', (req, res) => {
    res.send(`
      <form method="post" action="/" class="">
        <input type="text" name="username" placeholder="Username"><br>
        <input type="password" name="password" placeholder="Password" ><br>
        <button type="submit">Login</button>
      </form>
    `);
    
  });
app.post('/', (req, res) => {
    const  detail ={  
    username:req.body.username,
    passwd:req.body.password
    }
    dbConfig.database = 'passwd'
    db = mysql.createConnection(dbConfig)
    
    var sql = 'SELECT * from passwd where user = ? and passwd = ?'
    db.query(sql,[detail.username,detail.passwd],(error,result)=>{
        if(error){
            console.log(error);
        }else{
            if(detail.username == result[0].user && detail.passwd == result[0].passwd){
                if(isInteger(result[0].passwd)){
                    dbConfig.database = 'c' + result[0].passwd;

                }
                else{
                dbConfig.database = result[0].passwd;
                }
                if(isInteger)
                db = mysql.createConnection(dbConfig);
                sql = 'select * from studentDetail'
                db.query(sql,(error,result)=>{
                    if(error){
                        console.log(error)
                    }
                    else{
                        console.log(result)
                        res.render('db',{database1 : result[0].Name})
                    }
                })


                


            }
            else{
                console.log("Poda loosu")
            }
        }
    })

});  


app.listen(5000,()=>{
    console.log("Server started")
})