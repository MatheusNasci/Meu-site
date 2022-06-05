var database = require("../database/config");

function buscarUltimasMedidas(idVoto, nomeMod){
    instrucaoSql = `select count(${idVoto})
                        nomeMod
                    from votos
                    where nomeMod = ${nomeMod}`;
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


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}