// node.js script to clone all of the repos that you have at a location
// where `sonlite` is configured as an ssh alias 

var u = require('underscore')
    exec = require('child_process').exec,
    child = null,
    repos = null;

// grab the list of repos that you need to process
child = exec('ssh sonlite ls /home/sonlite/webapps/git/repos', function(error, stdout, stderr){

    repos = stdout.split('\n');

    u.each(repos, function(repo_name) { 
        child = exec('git clone sonlite:/home/sonlite/webapps/git/repos/' + repo_name, function (error, stdout, stderr) {
            console.log(stdout);
            console.error(stderr);
            if (error !== null) {
                console.log('exec error: ' + error);
            }
        });
    });
});