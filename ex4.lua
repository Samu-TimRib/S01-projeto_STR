io.write("Digite o primeiro número: ")
local a = tonumber(io.read())

io.write("Digite o segundo número: ")
local b = tonumber(io.read())

io.write("Escolha a operação (+, -, *, /): ")
local op = io.read()

local resultado

if op == "+" then
    resultado = a + b
elseif op == "-" then
    resultado = a - b
elseif op == "*" then
    resultado = a * b
elseif op == "/" then
    if b ~= 0 then
        resultado = a / b
    else
        print("Erro: divisão por zero!")
        return
    end
else
    print("Operação inválida!")
    return
end

print("Resultado: ", resultado)
