import express from "express";
import mysql from "mysql";

const server = express()
server.use(express.json());
const port = 4700;

server.listen(port, function(){
    console.log("Server started on port", port)
})

const db = mysql.createConnection({
    host: 'localhost',
    port: 8889,
    user: 'root',
    password: 'root',
    database: 'teslahw'
})

db.connect(function(error){
    (error) ? 
    console.log("Connection to SQL failed", error) 
    :
    console.log("Successfully connnected to SQL db")
})


server.get('/cars', (req, res) => {
    let SQLquery = 'CALL `getProducts`()';
    db.query (SQLquery, (error, data) => {
        (error) ? res.json({error_message: error}) : res.json ({message: data[0] })
    })
})

server.get('/cars/:id', (req, res) => {
    let id = req.params.id;
    let SQLquery = 'CALL `getProductsByID`(?)';
    db.query (SQLquery, [id], (error, data) => {
        (error) ? res.json({error_message: error}) : res.json ({message: data[0] })
    })
})



server.post('/cars', (req, res) => {
    let name = req.body.Name;
    let range = req.body.Range;
    let topSpeed = req.body.TopSpeed;
    let peakPower = req.body.PeakPower;

    let SQLquery = 'CALL `addProduct`(?, ?, ?, ?)';
    db.query(SQLquery, [name, range, topSpeed, peakPower], (error, data) => {
        (error) ? res.json({error_message: error}) : res.json({message: "Success", data: data[0]})
    })
})

server.put('/cars/:id', (req,res) => {
    let id = req.params.id;
    let name = req.body.Name;

    let SQLquery = 'CALL `updateProduct`(?, ?)'
    db.query(SQLquery, [id, name], (error, data) => {
        (error) ? res.json({error_message: error}) : res.json({message: "Successfully updated", data: data[0]})
    })
})


server.delete('/cars/:id', (req,res) => {
    let id = req.params.id;

    let SQLquery = 'CALL `deleteProduct`(?)'
    db.query(SQLquery, [id], (error, data) => {
        (error) ? res.json({error_message: error}) : res.json({message: "Successfully deleted", data: data[0]})
    })
})
