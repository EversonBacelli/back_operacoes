import mysql from "mysql2/promise"
import 'dotenv/config'; // Se estiver usando ES Modules (import)

let host = process.env.HOST_DATABASE
let port = process.env.PORTA_BD
let user = process.env.USER
let password = process.env.PWD
let database = process.env.DATA_BASE

async function conexao() {
    const pool = mysql.createPool({
        host: host, 
        port: port,
        user: user, 
        password: password, 
        database: database
    })
    return pool
}// <-- Fechando a função conexao

async function closeConexao(pool) {
    if (pool) {
        console.log("Fechando a conexão com o banco de dados")
        await pool.end()
    } else {
        console.log("Conexão já fechada")
    }
}

async function testarConexao() {
  try {
    const pool = await conexao();
    const conn = await pool.getConnection();
    await conn.ping();
    console.log("✅ Conexão com o MySQL bem-sucedida!");
    conn.release();
  } catch (erro) {
    console.error("❌ Falha ao conectar com o MySQL:", erro.message);
  }
}

export { conexao, closeConexao, testarConexao }