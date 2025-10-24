# Módulo Rastreador
module Rastreavel
  def obter_localizacao(hora)
    "Localização registrada às #{hora}: #{@localizacao}"
  end
end
 
# Módulo Perigoso
module Perigoso
  def calcular_risco
    "Risco alto! #{@nome} é uma ameaça!"
  end
end
 
# Classe base Participante
class Participante
  attr_reader :nome, :localizacao
 
  def initialize(nome)
    @nome = nome
  end
 
  def definir_localizacao(localizacao)
    @localizacao = localizacao
  end
 
  def to_s
    "#{@nome} (#{self.class})"
  end
end
 
# Classe Detetive (inclui Rastreavel)
class Detetive < Participante
  include Rastreavel
 
  def obter_localizacao(hora)
    "Detetive #{@nome} está em #{@localizacao} às #{hora}."
  end
end
 
# Classe MestreDoCrime (inclui Rastreavel e Perigoso)
class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso
 
  def obter_localizacao(hora)
    "Criminoso #{@nome} foi visto em #{@localizacao} às #{hora}!"
  end
 
  def calcular_risco
    "#{@nome} apresenta um risco extremo à segurança!"
  end
end
 
# Classe Cenario
class Cenario
  def initialize(participantes)
    @participantes = participantes
  end
 
  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
 
  def listar_ameacas
    ameacas = identificar_ameacas
    puts "\nParticipantes perigosos detectados:"
    if ameacas.empty?
      puts "Nenhuma ameaça encontrada."
    else
      ameacas.each { |a| puts a.calcular_risco }
    end
  end
end
 
# --- MAIN ---
puts "Digite a localização atual de Sherlock (Detetive):"
local_sherlock = gets.chomp
 
puts "Digite a localização atual de Moriarty (Mestre do Crime):"
local_moriarty = gets.chomp
 
# Instâncias dos participantes
sherlock = Detetive.new("Sherlock Holmes")
sherlock.definir_localizacao(local_sherlock)
 
moriarty = MestreDoCrime.new("Moriarty")
moriarty.definir_localizacao(local_moriarty)
 
# Criação do cenário
cenario = Cenario.new([sherlock, moriarty])
 
puts "\n=== RELATÓRIO DE LOCALIZAÇÕES ==="
puts sherlock.obter_localizacao("10:00")
puts moriarty.obter_localizacao("10:00")
 
# Identifica e mostra ameaças
cenario.listar_ameacas
