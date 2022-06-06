var database = require("../database/config");

function buscarUltimasMedidas() {
  instrucaoSql = `select 
  count(usuario.fkMod) as contagem, 
  mods.nomeMod
  from usuario
  join mods on idMod = fkMod group by nomeMod`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idVoto) {
  instrucaoSql = `select  
                        idVoto
                        nomeMod,
                        fkUsuario
                        from votos where idVoto = ${idVoto} 
                    order by idVoto desc`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarTotalFavoritos() {
  instrucaoSql = `select 
                  count(usuario.fkMod) as "Total Votos"
                  from usuario;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarUltimasMedidas,
  buscarMedidasEmTempoReal,
  buscarTotalFavoritos
};