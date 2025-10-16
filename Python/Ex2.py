from abc import ABC, abstractmethod

# Classe base
class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


# Classe filha: Tanque
class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) ativou sua barreira impenetrável!")


# Classe filha: Dano
class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} (Dano) Duzentoooossss!")


# Programa principal
if __name__ == "__main__":
    herois = [
        Tanque("Reinhardt"),
        Dano("Soldado: 76"),
        Tanque("Winston"),
        Dano("Reaper")
    ]

    for heroi in herois:
        heroi.usar_ultimate()
