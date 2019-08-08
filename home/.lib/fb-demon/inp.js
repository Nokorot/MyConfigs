const promptly = require('promptly');

module.exports = {
  pass: (async (prompt, callback) => {
      try {
        callback( await promptly.password(prompt, { replace: '*' }) );
      } catch( e ) {
        //if (e.message == 'canceled') return;
      }

    }),
  prompt: (async (prompt, callback) => {
      try {
        callback(await promptly.prompt(prompt));
      } catch (e) {
        /* if (e.message == 'canceled') return;
        callback(e); */
      }
    })
}
