import golosinas.*

object mariano {
	const bolsaDeGolosinas = []
	const golosinasDesechadas = []
	
	method comprar(unaGolosina) {
		bolsaDeGolosinas.add(unaGolosina)
	}
	
	method desechar(unaGolosina) {
		if (bolsaDeGolosinas.contains(unaGolosina)) {
			bolsaDeGolosinas.remove(unaGolosina)
			golosinasDesechadas.add(unaGolosina)
		}
	}
	
	method vaciarBolsa() {
		bolsaDeGolosinas.clear()
	}
	
	method cantidadDeGolosinas() = bolsaDeGolosinas.size()
	
	method tieneLaGolosina(unaGolosina) = bolsaDeGolosinas.contains(unaGolosina)
	
	method tieneGolosinaDeSabor(unSabor) = bolsaDeGolosinas.any(
		{ g => g.sabor() == unSabor }
	)
	
	method probarGolosinas() {
		bolsaDeGolosinas.forEach({ g => g.mordisco() })
	}
	
	method hayGolosinaSinTACC() = bolsaDeGolosinas.any(
		{ g => g.esLibreDeGluten() }
	)
	
	method preciosCuidados() = bolsaDeGolosinas.all({ g => g.precio() <= 10 })
	
	method golosinaDeSabor(unSabor) = bolsaDeGolosinas.find(
		{ g => g.sabor() == unSabor }
	)
	
	method golosinasDeSabor(unSabor) = bolsaDeGolosinas.filter(
		{ g => g.sabor() == unSabor }
	)
	
	method sabores() = bolsaDeGolosinas.map({ g => g.sabor() }).asSet()
	
	method golosinaMasCara() = bolsaDeGolosinas.max({ g => g.precio() })
	
	method golosinaMasPesada() = bolsaDeGolosinas.max({ g => g.peso() })
	
	method pesoGolosinas() = bolsaDeGolosinas.sum({ g => g.peso() })
	
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.filter(
		{ g => not self.tieneLaGolosina(g) }
	)
	
	method gustosFaltantes(gustosDeseados) = gustosDeseados.filter(
		{ s => not bolsaDeGolosinas.any({ g => g.sabor() == s }) }
	)
	
	// ITEMS DESAFIO !!!!!!!!!!!!!!!!!!!!!!!
	method gastoEn(unSabor) = self.golosinasDeSabor(unSabor).sum(
		{ g => g.precio() }
	)
	
	method cantidadDeGolosinasDeSabor(unSabor) = self.golosinasDeSabor(
		unSabor
	).size()
	
	method saborMasPopular() = self.sabores().max(
		{ unSabor => self.cantidadDeGolosinasDeSabor(unSabor) }
	)
	
	method saborMasPesado() = self.sabores().max(
		{ s => bolsaDeGolosinas.filter({ g => g.sabor() == s }).sum(
				{ g => g.peso() }
			) }
	)
	
	method comproYDesecho(unaGolosina) = golosinasDesechadas.contains(
		unaGolosina
	) && (not self.tieneLaGolosina(unaGolosina))
	
	//PARTE 2 !!!!!!!!!!!!!!!!!!!!!!!!!!!
	method baniar(unaGolosina) {
		bolsaDeGolosinas.add(new GolosinaBaniada(golosinaDentro = unaGolosina))
	}
}