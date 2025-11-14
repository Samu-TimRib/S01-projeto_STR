module Main where

-- Definição dos tipos

data Banda = Banda
  { nomeBanda :: String
  , genero    :: String
  , cache     :: Double
  } deriving (Show)

data Status = Ativo | Encerrado | Cancelado
  deriving (Show, Eq)

data Evento = Evento
  { bandas :: [Banda]
  , status :: Status
  } deriving (Show)

-- Função para calcular custo total

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0
custoTotalEvento (Evento lista _) =
  let totalCaches = sum (map cache lista)
      taxaProducao = totalCaches * 0.20  -- 20%
  in totalCaches + taxaProducao

-- Funções de bandas

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda abriu o evento."
bandaAbertura (Evento (b:_) _) = "Abertura: " ++ nomeBanda b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda encerrou o evento."
bandaEncerramento (Evento lista _) =
  "Encerramento: " ++ nomeBanda (last lista)

-- MAIN — Testes

main :: IO ()
main = do
    putStrLn "======= EVENTOS — CASA DE SHOWS ======="

    -- Bandas exemplo
    let rock = Banda "FireRock" "Rock" 5000
    let pop  = Banda "StarPop"  "Pop" 3000
    let indie = Banda "IndieVibes" "Indie" 2500
    let metal = Banda "SteelStorm" "Metal" 4500

    -- Três eventos diferentes
    let eventoAtivo = Evento [rock, pop, indie] Ativo
    let eventoEncerrado = Evento [indie, metal] Encerrado
    let eventoCancelado = Evento [rock, metal] Cancelado

    -- Teste evento ativo
    putStrLn "\nEvento Ativo:"
    print eventoAtivo
    putStrLn (bandaAbertura eventoAtivo)
    putStrLn (bandaEncerramento eventoAtivo)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoAtivo))

    -- Teste evento encerado
    putStrLn "\nEvento Encerrado:"
    print eventoEncerrado
    putStrLn (bandaAbertura eventoEncerrado)
    putStrLn (bandaEncerramento eventoEncerrado)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoEncerrado))

    -- Teste de evento cancelado
    putStrLn "\nEvento Cancelado:"
    print eventoCancelado
    putStrLn (bandaAbertura eventoCancelado)
    putStrLn (bandaEncerramento eventoCancelado)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoCancelado))
