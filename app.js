'use strict';

//var AWS = require('aws-sdk');

var mysql = require('mysql');

var dbHost = process.env.DB_HOST;
var dbUser = process.env.DB_USER;
var dbPassword = process.env.DB_PASSWORD;
var dbDatabase = process.env.DB_DATABASE;
var dbPort = process.env.DB_PORT;

var pool  = mysql.createPool({
    connectionLimit : 10,
    timeout  : 3000,
    acquireTimeout: 3000,
    connectTimeout: 3000,
    host: dbHost,
    user: dbUser,
    password: dbPassword,
    database: dbDatabase,
    port: dbPort
});

console.log('Loading function getDevelopments');

exports.handler = function(event, context, callback) {
    context.callbackWaitsForEmptyEventLoop = false;
    getDevelopments(function(err, data){
        if (err) {
            console.log(err, err.stack);
            return callback(err);
        } else {
            console.log('retrieved developments ok');
            return callback(null,data);
        }
    });
};

function getDevelopments(callback){
    pool.getConnection(function(err, connection) {
        connection.query('SELECT * FROM developments', function(err, rows) {
            if (err) {
                console.log(err, err.stack);
                return callback(err);
            } else {
                connection.release();
                return callback(null, rows);
            }
        });
    });
}
