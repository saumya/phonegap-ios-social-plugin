//
//  social.js
//
//	Saumya Ray
//
//	Original by:
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//

function Social() {
};

Social.prototype.available = function(callback) {
	cordova.exec(function(avail) {
		callback(avail ? true : false);
	}, null, "Social", "available", []);
};

Social.prototype.share = function(message, url, image) {
    //old deprecated
    //cordova.exec(null, null, "Social", "share", [message, image, url]);
    /*
    //new
    cordova.exec(function(winParam) {}, function(error) {}, "Social", 
    	"share", [message, image, url,false]);
    */
    /*
    //echo plugin
    window.echo = function(str, callback) {
	    cordova.exec(callback, function(err) {
	        callback('Nothing to echo.');
	    }, "Echo", "echo", [str]);
	};
	*/
};

//New implementation
window.share = function(message, url, image, callback) {
	console.log('Share : message='+message);
	console.log('Share : url='+url);
	
	//console.log('URL ='+urlString);
	    cordova.exec(callback, function(err) {
	        callback('Nothing to echo.');
	    //}, "Social", "share", [message+':'+url+':'+image]);
	    
	    //image : has not been implemented yet!
	    //TODO: implement "image" sharing
	    }, "Social", "share", [message,url]);
	
	};
  
Social.install = function() {
    if (!window.plugins) {
        window.plugins = {};	
    }

    window.plugins.social = new Social();
    return window.plugins.social;
};

cordova.addConstructor(Social.install);
