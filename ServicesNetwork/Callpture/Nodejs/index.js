var servidor = require('./config/custom-express')();
require('./config/mysql');

servidor.listen(3000, function(){
  console.log('Servidor rodando na porta 3000.');
});

