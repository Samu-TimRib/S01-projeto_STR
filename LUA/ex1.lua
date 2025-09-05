m,n,x = 0,0,0;

print("Entre com o primeiro parametro de intervalo: ");
m = tonumber(io.read())
print("Entre com o segundo parametro de intervalo: ");
n = tonumber(io.read())
print("Digite um valor inteiro x para ser a base: ");
x = tonumber(io.read())

if m > n then
  print("Intervalo inválido! O valor de m deve ser menor ou igual a n.")
else
  print("Múltiplos de " , x , " no intervalo [" , m , ", " , n , "]:")
  for i = m, n do
      if i % x == 0 then
          print(i)
      end
  end
end
