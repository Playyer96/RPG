var pg = require('pg');

//Properties

var pool = new pg.Pool();

//Execute function
function execute (query, onCompleted) {
  pool.connect (function (error, client) {
    if (error) return console.error('Error fetching client from pool', error);
  var client = new pg.Client();
  client.connect(function (err) {
    if (err) throw err;

    client.query (query, function (error, result) {
      if (error) return console.error('Error running query', error);
    client.query(query, function (err, result) {
      if (err) throw err;

      onCompleted (result.rows);
      onCompleted (result);

      client.end (function (error) {
        if (error) return console.error('Error ending the client', error);
      client.end(function (err) {
        if (err) throw err;
      });
    });
  });

  pool.on ('error', function (error, client) {
    console.error('Idle client error', error.message, error.stack);
  });
}

//Exporting module
module.exports.execute = execute;
