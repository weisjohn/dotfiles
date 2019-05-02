// node.js script to clone all of the repos that you have from a gitolite install
// where `gitolite` is configured as an ssh alias 

var u = require('underscore')
    exec = require('child_process').exec,
    child = null,
    urls = [
        "http://simpledesktops.com/desktops/desktops/2012/09/26/Cursor.png",
        "http://simpledesktops.com/desktops/desktops/2012/08/20/bars.png",
        "http://simpledesktops.com/desktops/desktops/2012/07/28/wallpaper.png",
        "http://simpledesktops.com/desktops/desktops/2012/05/12/void.png",
        "http://simpledesktops.com/desktops/desktops/2012/04/25/Radar.png",
        "http://simpledesktops.com/desktops/desktops/2012/04/13/Brain.png",
        "http://simpledesktops.com/desktops/desktops/2012/01/25/enso3.png",
        "http://simpledesktops.com/desktops/desktops/2012/01/25/tetris.png",
        "http://simpledesktops.com/desktops/desktops/2012/01/30/eclipse.png",
        "http://simpledesktops.com/desktops/desktops/2012/01/19/Boxes_Teal.png",
        "http://simpledesktops.com/desktops/desktops/2011/12/30/DoreSD.png",
        "http://simpledesktops.com/desktops/desktops/2011/12/28/Velo-Grey.png",
        "http://simpledesktops.com/desktops/desktops/2012/01/04/fases_da_lua-01_1.png",
        "http://simpledesktops.com/desktops/desktops/2011/12/22/isometric1.png",
        "http://simpledesktops.com/desktops/desktops/2011/11/07/cubechaos2.png",
        "http://simpledesktops.com/desktops/desktops/2011/09/21/mac_2.png",
        "http://simpledesktops.com/desktops/desktops/2011/09/22/camera.png",
        "http://simpledesktops.com/desktops/desktops/2011/07/21/network.png",
        "http://simpledesktops.com/desktops/desktops/2011/07/16/MilkyWay.png",
        "http://simpledesktops.com/desktops/desktops/2011/07/15/tree.png",
        "http://simpledesktops.com/desktops/desktops/2011/07/08/millimeterpapier-01.png",
        "http://simpledesktops.com/desktops/desktops/2011/07/02/Andromeda.png",
        "http://simpledesktops.com/desktops/desktops/2011/07/07/Safari_Desktop_Picture.png",
        "http://simpledesktops.com/desktops/desktops/2011/05/12/discos.png",
        "http://simpledesktops.com/desktops/desktops/2011/05/12/golden_ratio.png",
        "http://simpledesktops.com/desktops/desktops/2011/04/15/Mac_Wallpaper.png",
        "http://simpledesktops.com/desktops/desktops/2011/03/19/Aurora.png",
        "http://simpledesktops.com/desktops/desktops/2011/03/14/sunset-64.png",
        "http://simpledesktops.com/desktops/desktops/2011/01/14/TronLightCycle1.png",
        "http://simpledesktops.com/desktops/desktops/2011/01/14/TronLightCycle2.png",
        "http://simpledesktops.com/desktops/desktops/2010/12/19/I-Believe-You-Have-My-Stapler-simple.png",
        "http://simpledesktops.com/desktops/desktops/2010/12/03/Phones.png",
        "http://simpledesktops.com/desktops/desktops/2010/12/01/cloud_storage.png",
        "http://simpledesktops.com/desktops/desktops/2010/11/30/iMac_wallpaper-01.png",
        "http://simpledesktops.com/desktops/desktops/2010/12/01/tube.png",
        "http://simpledesktops.com/desktops/desktops/2010/11/20/ride.png",
        "http://simpledesktops.com/desktops/desktops/2010/10/19/DeathStar.png",
        "http://simpledesktops.com/desktops/desktops/2010/10/05/a_little_color.png",
        "http://simpledesktops.com/desktops/desktops/2010/08/31/cube.png",
        "http://simpledesktops.com/desktops/desktops/2010/08/18/manhattan.png",
        "http://simpledesktops.com/desktops/desktops/2010/08/21/i_want_to_help.png",
        "http://simpledesktops.com/desktops/desktops/2010/07/07/needs_charging.png",
        "http://simpledesktops.com/desktops/desktops/2010/07/07/recharge.png",
        "http://simpledesktops.com/desktops/desktops/2010/06/29/alliance.png",
        "http://simpledesktops.com/desktops/desktops/2010/06/29/galactic_empire.png",
        "http://simpledesktops.com/desktops/desktops/2010/06/24/NeedALongBlock.png",
        "http://simpledesktops.com/desktops/desktops/2010/06/25/rubiks_cube.png",
        "http://simpledesktops.com/desktops/desktops/2010/04/16/ipad-simple-2560x1600.png",
        "http://simpledesktops.com/desktops/desktops/2010/03/27/discs.png",
        "http://simpledesktops.com/desktops/desktops/2010/02/14/tabula-rasa.png",
        "http://simpledesktops.com/desktops/desktops/2010/02/05/blue-lego.png",
        "http://simpledesktops.com/desktops/desktops/2010/01/28/focus.png",
        "http://simpledesktops.com/desktops/desktops/2009/11/18/pixels.png",
	];

u.each(urls, function(url) { 
    child = exec('wget ' + url, function (error, stdout, stderr) {
        console.log(stdout);
        console.error(stderr);
        if (error !== null) {
            console.log('exec error: ' + error);
        }
    });
});
