print("Quantos números terá a tabela? ")
local qtd = tonumber(io.read())

local numeros = {}
local numeros_pares = {}

for i = 1, qtd do
    print("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

local tb_numeros_pares = 0;

for i = 1, qtd do
    if numeros[i] % 2 == 0 then
        table.insert(numeros_pares, numeros[i])
        tb_numeros_pares = tb_numeros_pares+1;
    end
end

print("Números : ")
for i = 1, tb_numeros_pares do
    io.write(numeros_pares[i], ",")
end
print(" esses são os números pares da tabela")
