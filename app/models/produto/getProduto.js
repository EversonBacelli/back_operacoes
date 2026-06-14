import {conexao} from '../../DAO/conexao.js'


async function buscarProdutos(){
  console.log('DAO de Produto')
    const sql = `SELECT * FROM PRODUTO;`
    
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


export {buscarProdutos}