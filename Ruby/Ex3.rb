# Classe base Musico
class Musico
  attr_reader :nome, :instrumento
 
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end
 
  def tocar_partitura(peca)
    raise NotImplementedError, "Este método deve ser implementado nas subclasses!"
  end
 
  def to_s
    "#{@nome} (#{@instrumento})"
  end
end
 
# Subclasse Pianista
class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end
 
  def tocar_partitura(peca)
    puts "#{@nome} toca a peça '#{peca}' com emoção no piano!"
  end
end
 
# Subclasse Violinista
class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end
 
  def tocar_partitura(peca)
    puts "#{@nome} executa a peça '#{peca}' com precisão no violino!"
  end
end
 
# Classe Maestro
class Maestro
  def initialize(musicos)
    @musicos = musicos
  end
 
  def iniciar_ensaio(peca)
    puts "\n Iniciando ensaio da peça '#{peca}' "
    @musicos.each { |musico| musico.tocar_partitura(peca) }
  end
 
  def mudar_foco(estado)
    puts "\nMudando o foco dos músicos para: #{estado}"
    mensagens = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
    mensagens.each { |msg| puts msg }
  end
end
#main
puts "Digite o nome da peça a ser tocada:"
peca = gets.chomp
 
m1 = Pianista.new("Kousei")
m2 = Violinista.new("Kaori")
m3 = Pianista.new("Emi")
 
maestro = Maestro.new([m1, m2, m3])
maestro.iniciar_ensaio(peca)
maestro.mudar_foco("Concentrado")
