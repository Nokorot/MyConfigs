
const appstateFile = './appstate.json';

const fs = require("fs");
const util = require("util");
const inp = require("./inp");

module.exports = function (callback) {
	const login = require("facebook-chat-api");

	if (fs.existsSync(appstateFile)) {
		login( {appState: JSON.parse(
			fs.readFileSync(appstateFile, 'utf8'))}, callback);
	} else {
		inp.prompt("I need some sign-in details. What's your email?\nemail: ", (email) => {
			inp.pass('password: ', (pass) => {
				login({email: email, password: pass}, (err, api) => {
					if (err) callback(err);
					fs.writeFileSync(appstateFile, JSON.stringify(api.getAppState()));
					callback(undefined, api);
				});
			});
		});
	}
}
