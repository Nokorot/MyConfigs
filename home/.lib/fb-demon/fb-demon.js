#!/usr/bin/js

const PIPE = './PIPE' // TODO: argument

const fs = require("fs")
var access = fs.createWriteStream('/var/log/node/fb-demon.log', { flags: 'a' });//('/var/log/node/api.access.log');
process.stdout.write = process.stderr.write = access.write.bind(access);

console.log("\n\n " + new Date())

function readPipe(fbd, api) {
  const fd = fs.openSync('./PIPE', 'r+')
  const stream = fs.createReadStream(null, {fd})

  const openOutPipe = (pipe) => fs.createWriteStream(pipe, { flags: 'a' });

  stream.on('data', (d) => {
    argv = d.toString().trim().split(' ');
	try {
      if (fbd[argv[1]])	{
		out = openOutPipe(argv[0]);
		console.log(argv.slice(2).join(' '))
        fbd[argv[1]](JSON.parse(argv.slice(2).join(' ')), out, () => {
			out.end();
			console.log("Closed")
		}); }
      else console.log("Function \"" + argv[1] + "\" is unknown!");
    } catch (e) {
      console.error(e);
    }
  });
}

function main(argv) {
  require('./login')((err, api) => {
    if (err) { console.error(err); process.exit(1); }

    var fbd = {};

    const fbdFuncNames = [
      'getUserID',
      'sendMessage',
      'sendFile'
    ];

    fbdFuncNames.forEach((v) => {
      fbd[v] = require('./src/' + v)(fbd, api);
    });

    readPipe(fbd, api);
  });
}
main(process.argv.slice(2));
