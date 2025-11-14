module Main where

-- Definição do tipo Bebida
data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Float
  } deriving (Show)

-- Definição do status de um pedido
data Status = Aberto | Entregue | Cancelado
  deriving (Show, Eq)

-- Definição do tipo Pedido
data Pedido = Pedido
  { bebidas :: [Bebida]
  , status  :: Status
  } deriving (Show)

-- Função que calcula o valor total do pedido
valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido lista _) =
  let totalBebidas = sum (map preco lista)
  in totalBebidas + 5.0   -- taxa fixa de serviço

-- Função que retorna a primeira bebida do pedido
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nao ha bebidas no pedido."
primeiraBebida (Pedido (b:_) _) = nome b

main :: IO ()
main = do

    -- Criando exemplos
    let cafe = Bebida "Cafe Expresso" "Cafe" 7.0
    let cha  = Bebida "Cha Verde" "Cha" 5.0
    let suco = Bebida "Suco de Laranja" "Suco" 8.0

    -- Criando pedidos
    let pedido1 = Pedido [cafe, cha, suco] Aberto
    let pedido2 = Pedido [] Aberto
    let pedido3 = Pedido [cafe] Cancelado
    
    putStrLn "\nPedido 1:"
    print pedido1
    putStrLn ("Total: R$" ++ show (valorTotalPedido pedido1))
    putStrLn ("Primeira bebida: " ++ primeiraBebida pedido1)

    putStrLn "\nPedido 2:"
    print pedido2
    putStrLn ("Total: R$" ++ show (valorTotalPedido pedido2))
    putStrLn ("Primeira bebida: " ++ primeiraBebida pedido2)

    putStrLn "\nPedido 3 (Cancelado):"
    print pedido3
    putStrLn ("Total: R$" ++ show (valorTotalPedido pedido3))
    putStrLn ("Primeira bebida: " ++ primeiraBebida pedido3)
