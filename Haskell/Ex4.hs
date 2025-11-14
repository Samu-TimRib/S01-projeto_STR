module Main where

-- Definição dos tipos de serviço
data Servico = Servico
  { nomeServico :: String
  , tipoServico :: String
  , preco       :: Double
  } deriving (Show)

data Status = EmAndamento | Finalizado | Cancelado
  deriving (Show, Eq)

data Atendimento = Atendimento
  { servicos :: [Servico]
  , statusAt :: Status
  } deriving (Show)

-- Função bônus espiritual

bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista =
  let somaBase = sum (map preco lista)
      qtd = length lista
      extraBonus = if qtd > 3 then somaBase * 0.25 else 0           -- bônus 25%
      valorComBonus = somaBase + extraBonus
  in if valorComBonus > 500
        then valorComBonus * 0.90   -- aplica 10% de desconto
        else valorComBonus

-- Valor final do atendimento

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0
valorFinalAtendimento (Atendimento lista _) 
  | total > 500 = total              -- já inclui desconto da função
  | otherwise = total
  where
    total = bonusEspiritual lista

-- Primeiro serviço

descricaoServico :: Atendimento -> String
descricaoServico (Atendimento [] _) =
  "Nenhum serviço foi registrado."
descricaoServico (Atendimento (s:_) _) =
  "Primeiro serviço: " ++ nomeServico s ++ " (" ++ tipoServico s ++ ")"

-- MAIN — Exemplo de uso

main :: IO ()
main = do
    putStrLn "======= CASA DE BANHOS DA YUBABA ======="

    -- Criando serviços
    let banho    = Servico "Banho purificador"  "Banho"     120
    let massagem = Servico "Massagem espiritual" "Massagem" 200
    let banquete = Servico "Banquete dos Espiritos" "Banquete" 350
    let aroma    = Servico "Aromaterapia celestial" "Relaxamento" 90

    -- Tipos de Atendimentos
    let at1 = Atendimento [banho, massagem] EmAndamento
    let at2 = Atendimento [banho, massagem, banquete, aroma] Finalizado
    let at3 = Atendimento [banquete, massagem] Cancelado

    -- Atendimento 1
    putStrLn "\nAtendimento 1:"
    print at1
    putStrLn (descricaoServico at1)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento at1))

    -- Atendimento 2
    putStrLn "\nAtendimento 2:"
    print at2
    putStrLn (descricaoServico at2)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento at2))

    -- Atendimento 3
    putStrLn "\nAtendimento 3 (Cancelado):"
    print at3
    putStrLn (descricaoServico at3)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento at3))
