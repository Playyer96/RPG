var pg = require('pg');

function execute (query, onCompleted) {
  var client = new pg.Client(config);
  client.connect(function (err) {
    if (err) throw err;

    client.query(query, function (err, result) {
      if (err) throw err;

      onCompleted (result);

      client.end(function (err) {
        if (err) throw err;
      });
    });
  });
}

module.exports.execute = execute;
