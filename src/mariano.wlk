import golosinas.*

object mariano {
	var golosinas = []
	var golosinasDesechadas = []
		
	method comprar(unaGolosina) {golosinas.add(unaGolosina)}
	method comprarVarias(lista) {golosinas.addAll(lista)}
	method vaciasBolsa() {golosinas.clear()}
	method desechar(unaGolosina) {
		golosinas.remove(unaGolosina)
		golosinasDesechadas.add(unaGolosina)
	}
	method cantidadDeGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
	method probarGolosinas() {golosinas.forEach( { g => g.mordisco() } ) }
	method hayGolosinasSinTACC() = golosinas.any( { g => g.libreGluten() } )
	method hayGolosinasSinTACCConAll() = not golosinas.all( { g => g.libreGluten() } )
	method preciosCuidados() = golosinas.all( { g => g.precio() <= 10 } )
	method preciosCuidadosConAny() = not golosinas.any( { g => g.precio() > 10 } )
	method golosinaDeSabor(unSabor) = golosinas.find( { g => g.gusto() == unSabor } )
	method golosinasDeSabor(unSabor) = golosinas.filter( { g => g.gusto() == unSabor } )
	method sabores() = golosinas.map( { g => g.gusto() } ).asSet() // Convierte la lista en conjunto.
	method golosinaMasCara() = golosinas.max( { g => g.precio() } )
	method golosinaMasCaraConMap() = golosinas.map( { g => g.precio() } ).max()
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()
	method pesoGolosinas() = golosinas.sum( { g => g.peso() } )
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.asSet().difference(golosinas.asSet())
	method golosinasQueTengo(golosinasDeseadas) = golosinas.asSet().difference(golosinasDeseadas.asSet())
	method gustosFaltantes(gustosDeseados) = gustosDeseados.asSet().difference(self.sabores())
	method gastoEn(sabor) = self.golosinasDeSabor(sabor).sum( { g => g.precio() } )
	method precioGolosinaMasCaraDeUnSabor(sabor) = self.golosinasDeSabor(sabor).max( { g => g.precio() } ).precio()
	method cantidadGolosinasDeUnSabor(unSabor) = self.golosinasDeSabor(unSabor). size()
	method saborMasPopular() = self.sabores().max( { s => self.cantidadGolosinasDeUnSabor(s) } )
	
	method saborMasPesado() {}		// Completar
	
	method comproYDesecho(golosina) = golosinasDesechadas.contains(golosina)
}

