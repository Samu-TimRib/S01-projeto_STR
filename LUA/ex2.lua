function maiorValor(tabela)
    local maior = tabela[1]
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

print("Quantos números terá a tabela? ")
local qtd = tonumber(io.read())

local numeros = {}

for i = 1, qtd do
    print("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

local maior = maiorValor(numeros)
print("O maior valor da tabela é: " .. maior)
