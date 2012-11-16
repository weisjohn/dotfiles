// node.js script to clone all of the repos that you have from a gitolite install
// where `gitolite` is configured as an ssh alias 

var u = require('underscore')
    exec = require('child_process').exec,
    child = null,
    lines = null,
    repos = null,
    read_write = /.R.W/;
    // this matches lines like ' R W\tHermesaurus',

child = exec('ssh gitolite info', function(error, stdout, stderr){

    // remove the "hello, user, this is gitolite" 
    lines = stdout.split('\n').slice(2);

    // filter out the lines for repos that aren't read and write
    repos = u.chain(lines)
        .filter(function(line) { return read_write.test(line) })
        .map(function(line) { 
            return line.split('\t')[1]; // clean up line to remove the R W\t declaration
        }).each(function(repo_name) { 
        child = exec('git clone gitolite:' + repo_name, function (error, stdout, stderr) {
            console.log(stdout);
            console.error(stderr);
            if (error !== null) {
                console.log('exec error: ' + error);
            }
        });
    });

});