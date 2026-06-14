import express from 'express'
// Importando as funções lógicas do banco de dados (vamos criá-las no passo abaixo)
import { buscarClientes } from './models/clientes/getCliente.js'
import { buscarProdutos } from './models/produto/getProduto.js'
import { buscarPedidos } from './models/pedido/getPedido.js'

const app = express()

// Middleware obrigatório para o Express conseguir ler o corpo (body) das requisições em formato JSON
app.use(express.json())

// Rota Base
app.get('/', (req, res) => {
    res.json({ mensagem: 'API de Estacionamento Rodando perfeitamente!' })
})

// 1. CONSULTAR TODOS (GET)
app.get('/cliente', async (req, res) => {
    try {
        const clientes = await buscarClientes()
        res.json(clientes)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar clientes', detalhes: erro.message })
    }
})

app.get('/produto', async (req, res) => {
    try {
        const produtos = await buscarProdutos()
        res.json(produtos)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar produtos   ', detalhes: erro.message })
    }
})

app.get('/pedido', async (req, res) => {
    try {
        const pedidos = await buscarPedidos()
        res.json(pedidos)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar pedidos', detalhes: erro.message })
    }
})


// Inicialização do Servidor
app.listen(3000, () => {
  console.log('🚀 Server is running on http://localhost:3000')
})