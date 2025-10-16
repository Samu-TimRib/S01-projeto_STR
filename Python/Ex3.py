# Classe de composição
class ArmaCorpoACorpo:
    def __init__(self, nome: str):
        self.nome = nome

    def __str__(self):
        return f"Arma corpo a corpo: {self.nome}"


# Classe agregada
class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} com a arma {self.arma}"


# Classe principal (composição + agregação)
class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        # Composição: Joker cria e gerencia sua própria arma
        self.arma = ArmaCorpoACorpo("Faca")
        # Agregação: equipe passada como argumento
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"Joker está armado com uma {self.arma.nome}.")
        print("Equipe dos Phantom Thieves:")
        for membro in self.equipe:
            print(f"- {membro}")


# Programa principal
if __name__ == "__main__":
    # Criação dos membros da equipe (agregação)
    morgana = PhantomThieves("Morgana", "Espada Curta")
    ryuji = PhantomThieves("Ryuji", "Taco de Ferro")
    ann = PhantomThieves("Ann", "Chicote")

    # Joker agrega os membros
    equipe = [morgana, ryuji, ann]
    joker = Joker(equipe)

    # Mostrar a equipe completa
    joker.mostrar_equipe()
