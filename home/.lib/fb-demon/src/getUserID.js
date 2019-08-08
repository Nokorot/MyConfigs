
const util = require("util");

module.exports = function (fbd, api) {
  return function (argv, out, callback) {
	console.log(argv.join(' '))

    api.getUserID(argv.join(' '), (err, data) => {
      if(err) { out.write(err); return console.error(err); }

      out.write(JSON.stringify(data) + "\n");
	  callback()
    });

  }
};
