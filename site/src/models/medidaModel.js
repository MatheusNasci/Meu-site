var database = require("../database/config");

function buscarUltimasMedidas(idDado, limite_linhas) {
    instrucaoSql = `select top ${limite_linhas}
                        temperatura, 
                        umidade,
                        FORMAT(momento,'hh:mm:ss') as momento_grafico
                    from dados_sensor
                    where fkSensor = ${idDado}
                    order by idDado desc`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idDado) {
    instrucaoSql = `select top 1
                        temperatura, 
                        umidade, 
                        FORMAT(momento,'hh:mm:ss') as momento_grafico, 
                        fkSensor 
                        from dados_sensor where fkSensor = ${idDado} 
                    order by idDado desc`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}