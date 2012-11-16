
var request = require('request'),
	repos;

request('https://api.github.com/users/weisjohn/repos', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    repos = JSON.parse(body);
  }
});