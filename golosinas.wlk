import mariano.*

object frutilla {
	
}

object chocolate {
	
}

object naranja {
	
}

object vainilla {
	
}

class Bombon {
	var peso = 15
	
	method precio() = 5
	
	method sabor() = frutilla
	
	method esLibreDeGluten() = true
	
	method peso() = peso
	
	method mordisco() {
		peso = ((peso * 0.8) - 1).max(0)
	}
}

class Alfajor {
	var peso = 300
	
	method precio() = 12
	
	method sabor() = chocolate
	
	method esLibreDeGluten() = false
	
	method peso() = peso
	
	method mordisco() {
		peso *= 0.8
	}
}

class Caramelo {
	var peso = 5
	var property sabor
	
	method peso() = peso
	
	method precio() = 1
	
	method esLibreDeGluten() = true
	
	method mordisco() {
		peso -= 1
	}
}

class Chupetin {
	var peso = 7
	
	method peso() = peso
	
	method precio() = 2
	
	method sabor() = naranja
	
	method esLibreDeGluten() = true
	
	method mordisco() {
		if (peso >= 2) {
			peso *= 0.9
		}
	}
}

class Oblea {
	var peso = 250
	
	method peso() = peso
	
	method precio() = 5
	
	method sabor() = vainilla
	
	method esLibreDeGluten() = false
	
	method mordisco() {
		if (peso > 70) {
			peso /= 2
		} else {
			peso *= 0.75
		}
	}
}

class Chocolatin {
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) {
		pesoInicial = unPeso
	}
	
	method precio() = pesoInicial * 0.5
	
	method peso() = (pesoInicial - comido).max(0)
	
	method sabor() = chocolate
	
	method esLibreDeGluten() = false
	
	method mordisco() {
		comido += 2
	}
}

class GolosinaBaniada {
	var golosinaDentro
	var pesoBanio = 4
	var mordiscosDados = 0
	
	method golosinaDentro(unaGolosina) {
		golosinaDentro = unaGolosina
	}
	
	method peso() = golosinaDentro.peso() + pesoBanio
	
	method precio() = golosinaDentro.precio() + 2
	
	method sabor() = golosinaDentro.sabor()
	
	method esLibreDeGluten() = golosinaDentro.esLibreDeGluten()
	
	method mordisco() {
		golosinaDentro.mordisco()
		if (mordiscosDados < 2) {
			pesoBanio = (pesoBanio - 2).max(0) // Asegura no negativo
			mordiscosDados += 1
		}
	}
}

class PastillaTuttiFrutti {
	var property esLibreDeGluten
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method peso() = 5
	
	method precio() = if (esLibreDeGluten) 7 else 10
	
	method mordisco() {
		saborActual = (saborActual + 1) % 3
	}
	
	method sabor() = sabores.get(saborActual)
}

class BombonDuro inherits Bombon {
	override method mordisco() {
		peso = (peso - 1).max(0)
	}
	
	method gradoDeDureza() = if (peso > 12) {
		3
	} else {
		if (peso.between(8, 12)) 2 else 1
	}
}

class CarameloCorazonDeChocolate inherits Caramelo {
	override method mordisco() {
		super()
		self.sabor(chocolate)
	}
	
	override method precio() = super() + 1
}

class ObleaCrujiente inherits Oblea {
	var cantidadDeMordiscos = 0
	
	override method mordisco() {
		super()
		cantidadDeMordiscos += 1
		if (cantidadDeMordiscos <= 3) {
			peso -= 3
		}
	}
	
	method estaDebil() = cantidadDeMordiscos > 3
}

class ChocolatinVIP inherits Chocolatin {
	override method peso() = super() * (1 + self.humedad())
	
	method humedad() = heladeraDeMariano.humedad()
}

class ChocolatinPremium inherits ChocolatinVIP {
	override method humedad() = super() / 2
}