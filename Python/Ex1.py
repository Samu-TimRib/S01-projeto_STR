class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    # Getter para vida
    @property
    def vida(self):
        return self._vida

    # Setter para vida
    @vida.setter
    def vida(self, nova_vida):
        if nova_vida < 0:
            print("A vida não pode ser negativa!")
        else:
            self._vida = nova_vida

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência."


class Cavaleiro(Personagem): #existem vários cavaleiros, mas so alguns tem armadura pesada
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self): # ter ou não a armadura pesada
        tipo_armadura = "com armadura pesada" if self.armadura_pesada else "sem armadura pesada"
        return f"Cavaleiro {tipo_armadura}, com {self._vida} de vida e {self._resistencia} de resistência."


# Exemplos de uso:
p = Personagem(100, 50)
print(p)

c = Cavaleiro(150, 80, True)
print(c)

# Testando o setter
c.vida = -20  # Deve avisar que a vida não pode ser negativa
c.vida = 120
print(c)
