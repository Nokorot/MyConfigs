
const util = require("util");
const fs = require("fs");

module.exports = function (fbd, api) {
  return function (argv, out, callback) {
    if (argv.length < 2)
		out.write("Err: Too few arguments");	

	api.sendMessage({
		body: "",
		attachment: fs.createReadStream(argv[0])
	}, argv[1].trim(), (err) => {
		if (err) out.write(err.errorSummary);
		callback()
	});
  }
};
