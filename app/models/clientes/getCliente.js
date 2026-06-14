import {conexao} from '../../DAO/conexao.js'


async function buscarClientes(){
  console.log('DAO de CLIENTE')
    const sql = `SELECT * FROM CLIENTE;`
    
    const conn = await conexao()
    try {
        // Executar a consulta
        const [rows, fields] = await conn.query(sql);
        await conn.end()
        return rows
      } catch (err) {
        return err.message
      }
}


export {buscarClientes}