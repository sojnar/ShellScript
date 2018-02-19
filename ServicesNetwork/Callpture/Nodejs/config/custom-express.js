const express = require('express');
var consign = require('consign');
var cors = require('cors');

module.exports = function(){
  var app = express();
  app.use(cors());

  consign()
    .include('controles')
    .into(app);

  return app;
}

