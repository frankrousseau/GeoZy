/** server.js **/
"use strict";
var http = require('http'),
    express = require('express'),
    app = express(),

    /* We add configure directive to tell express to use Jade to
       render templates */
    app.configure(function() {
        app.set('views', __dirname + '/index.html');
        app.engine('.html', require('jade').__express);
});



    /* This will allow Cozy to run your app smoothly but
     it won't break other execution environment */
    var port = process.env.PORT || 9250;
    var host = process.env.HOST || "127.0.0.1";

    // Starts the server itself
    var server = http.createServer(app).listen(port, host, function() {
        console.log("Server listening to %s:%d within %s environment",
                    host, port, app.get('env'));
});
