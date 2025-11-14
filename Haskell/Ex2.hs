module Main where

-- Definição do tipo Item
data Item = Item
  { nomeItem   :: String
  , categoria  :: String   -- "Arma", "Poção", "Equipamento"
  , precoItem  :: Double
  } deriving (Show)

-- Definição do tipo CompraZelda
data CompraZelda = CompraZelda
  { itens :: [Item]
  } deriving (Show)

-- Função calculaDesconto

calculaDesconto :: [Item] -> Double
calculaDesconto lista =
  let total = sum (map precoItem lista)
  in if total > 200
       then total * 0.10   -- 10% de desconto
       else 0

-- Função valorFinal usando guards

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda lista)
  | total > 200 = total - desconto  -- desconto aplicado
  | total <= 200 = total + 15   -- frete
  where
    total = sum (map precoItem lista)
    desconto = calculaDesconto lista

-- 3) Função principal para testes (main)

main :: IO ()
main = do
    putStrLn "------ COMPRAS NAS LOJAS DE HYRULE ------"

    -- exemplos
    let espada = Item "Espada de Prata" "Arma" 150
    let pocao  = Item "Poção de Vida"   "Poção" 40
    let escudo = Item "Escudo Hyliano"  "Equipamento" 120
    let flechas = Item "Flechas"        "Arma" 30

    -- Compras
    let compra1 = CompraZelda [espada, pocao]       -- total = 190 → frete
    let compra2 = CompraZelda [escudo, pocao, flechas] -- total = 190 → frete
    let compra3 = CompraZelda [escudo, espada]      -- total = 270 → desconto

    -- Teste Compra 1
    putStrLn "\nCompra 1:"
    print compra1
    putStrLn ("Valor final: " ++ show (valorFinal compra1))

    -- Teste Compra 2
    putStrLn "\nCompra 2:"
    print compra2
    putStrLn ("Valor final: " ++ show (valorFinal compra2))

    -- Teste Compra 3
    putStrLn "\nCompra 3 (com desconto):"
    print compra3
    putStrLn ("Valor final: " ++ show (valorFinal compra3))
