import {conexao} from '../../DAO/conexao.js'


async function buscarPedidos(){
  console.log('DAO de Pedido')
    const sql = `SELECT 
                        p.num_pedido,
                        p.data_elaboracao,
                        -- Informações do Cliente (agora usando o apelido correto 'c')
                        c.id_cliente,
                        c.nome AS nome_cliente,
                        c.telefone AS telefone_cliente,
                        c.status AS status_cliente,
                        c.limite_credito,
                        -- Informações do Item do Pedido
                        ip.quantidade,
                        -- Informações do Produto
                        prod.id_produto,
                        prod.nome_produto,
                        prod.preco AS preco_unitario,
                        (ip.quantidade * prod.preco) AS subtotal_item,
                        -- Informações da Categoria
                        cat.id_categoria,
                        cat.nome_categoria
                    FROM PEDIDO p
                    INNER JOIN CLIENTE c -- <--- O ajuste foi aqui! Mudado de 'p_cli' para 'c'
                        ON p.id_cliente = c.id_cliente
                    INNER JOIN ITEM_PEDIDO ip 
                        ON p.num_pedido = ip.num_pedido
                    INNER JOIN PRODUTO prod 
                        ON ip.id_produto = prod.id_produto
                    INNER JOIN CATEGORIA cat 
                        ON prod.id_categoria = cat.id_categoria
                    ORDER BY p.num_pedido ASC, prod.nome_produto ASC
                    LIMIT 0, 1000;
                `
    
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


export {buscarPedidos}