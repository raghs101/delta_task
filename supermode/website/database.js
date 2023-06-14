const mysql = require('mysql');
const connection = mysql.createConnection({
    host : 'localhost',
    databse : 'passwd',
    user : 'root',
    password : 'delta@sql'

});
connection.connect(function(error){
    if(error){
        throw error;
    }
    else{
        console.log("Sucess")
    }
})
module.exports = connection;