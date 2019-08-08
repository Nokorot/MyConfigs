
const util = require("util");
const fs = require("fs")

module.exports = function (fbd, api) {
  return function (argv, out, callback) {
    if (argv.length < 2)
		out.write("Err: Too few arguments");

	msg = argv[0];
	if (typeof(msg) == 'string') 
		msg = { body: msg }

	if (msg['attachment'])
		msg['attachment'] = fs.createReadStream(msg['attachment']);

	api.sendMessage(argv[0], argv[1].trim(), callback);
  }
};
