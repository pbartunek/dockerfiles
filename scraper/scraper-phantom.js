/*
 * render multiple URLs 
 * based on PhantomJS example:
 * https://github.com/ariya/phantomjs/blob/master/examples/render_multi_url.js
 */

"use strict";
var RenderUrlsToFile, arrayOfUrls, system;

system = require("system");

RenderUrlsToFile = function(urls, callbackPerUrl, callbackFinal) {
  var getFilename, next, page, retrieve, urlIndex, webpage;
  urlIndex = 0;
  webpage = require("webpage");
  page = null;
  getFilename = function(url) {
    return urlIndex + "-" + url.replace(/http.*:\/\//, "") + ".png";
  };
  next = function(status, url, file) {
    page.close();
    callbackPerUrl(status, url, file);
    return retrieve();
  };
  retrieve = function() {
    var url;
    if (urls.length > 0) {
      url = urls.shift();
      urlIndex++;
      url = "http://" + url
      page = webpage.create();
      page.viewportSize = {
        width: 1024,
        height: 768
      };
      var time = new Date().toLocaleTimeString();
      console.log(time + " Rendering: " + url);

      page.settings.userAgent = "Phantom.js";
      page.settings.resourceTimeout = 10000;
      page.onResourceTimeout = function(e) {
        var time = new Date().toLocaleTimeString();
        console.log(time + " Timeout connecting to: " + url);
      };
      return page.open(url, function(status) {
        var file;
        file = getFilename(url);
        if (status === "success") {
          return window.setTimeout((function() {
            page.render(file);
            return next(status, url, file);
          }), 500);
        } else {
          return next(status, url, file);
        }
      });
    } else {
      return callbackFinal();
    }
  };
  return retrieve();
};

arrayOfUrls = null;

if (system.args.length > 1) {
  var time = new Date().toLocaleTimeString();
  console.log("Scraper started at " + time);
  arrayOfUrls = Array.prototype.slice.call(system.args, 1);
} else {
  console.log("Usage: phantomjs scraper-phantom.js [domain.name1, domain.name2, ...]");
  arrayOfUrls = [];
}

RenderUrlsToFile(arrayOfUrls, (function(status, url, file) {
  var time = new Date().toLocaleTimeString();
  if (status !== "success") {
    return console.log(time + " Unable to render " + url);
  } else {
    return console.log(time + " Rendered " + url + ", saved as: " + file);
  }
}), function() {
  return phantom.exit();
});
