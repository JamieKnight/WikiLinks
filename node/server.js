var http = require('http');
var http = require('http');

var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database(':memory:');

db.serialize(function() {
  db.run("CREATE TABLE queue(id INTEGER PRIMARY KEY AUTOINCREMENT, domain TEXT, status TEXT, guid TEXT);");

  var stmt = db.prepare("INSERT INTO queue (domain, status) VALUES (?, ?)");
  
  stmt.run("bbc.co.uk", "pending");
  stmt.finalize();

  db.each("SELECT * FROM queue WHERE status = 'pending';", function(err, row) {
      console.log(row);
  });
});

http.createServer(function (req, res) {

  var spawn   = require('child_process').spawn;

  var command = spawn('ls', ['-l']);
  var output  = [];

  command.stdout.on('data', function(chunk) {
    output.push(chunk);
  }); 

  command.on('close', function(code) {
    if (code === 0)
      res.end(Buffer.concat(output));
    else
      res.end(500); // when the script fails, generate a Server Error HTTP response
  });



 /*
 res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
*/
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');