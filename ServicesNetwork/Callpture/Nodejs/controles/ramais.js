var con = require('../config/mysql');

module.exports = function(app){

  app.get('/', function(req, res){
    console.log('Recebida requisicao de teste na porta 3000.')
    res.send('ok, Deu certo!');
  }); 

  app.get('/ramais', function(req, res){
    con.query('select * from ramais.ramais;', function (error, results, fields) {
        if (error) throw error;
        res.send(results);
    });
  }); 
}
