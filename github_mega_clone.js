var request = require('request'),
    u = require('underscore')
    exec = require('child_process').exec,
    child,
    repos;

request('https://api.github.com/users/weisjohn/repos', function (error, response, body) {
    if (!error && response.statusCode == 200) {
    
        // grab all the repos from github
        repos = JSON.parse(body);

        // retrive the ssh locations, process them one by one
        var urls = u.pluck(repos, 'ssh_url');

        u.each(urls, function(ssh_url) { 
            child = exec('git clone ' + ssh_url, function (error, stdout, stderr) {
                console.log(stdout);
                console.error(stderr);
                if (error !== null) {
                    console.log('exec error: ' + error);
                }
            });
        });
    }
});
