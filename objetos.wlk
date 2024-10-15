import wollok.game.*
import juego.*

object entrenador {
  var property position = game.center()
  method position() = position
  method image() = "entrenador2.png"
  const pokemon = pokemonNuestro
  method pelear() {
  
  }

}

object fondoPelea {
  var property position = game.center()
  method image() = "fondoPelea3.png"
}

object pokemonNuestro {
  var property nombre = "Pikachu"
  const tipo = "electrico"
  var property vida = 100
  const poderes = [impactrueno,placaje,mordisco,descanso]

  method recibirDanio(poder){
 		vida = 0.max(vida - poder.danioBase())
    }
  method atacarAOtroPokemon(poder,contrincante) {
    if(contrincante.tipo() == "Electrico") contrincante.recibirDanio(poder) else contrincante 
  }

}
// Poderes:
object impactrueno {
  const tipoAtaque = "electrico"
  var property danioBase = 35
}

object mordisco {
  const tipoAtaque = "Siniestro" 
  const danioBase = 15
}

object descanso {
  const tipoAtaque = "normal" 
  const danioBase = 0
}

object lanzallamas {
  const tipoAtaque = "fuego" 
  const danioBase = 35
}

object pistolaDeAgua {
  const tipoAtaque = "agua" 
  const danioBase = 35
}

object placaje {
  const tipoAtaque = "normal" 
  const danioBase = 20
}

object latigoCepa {
  const tipoAtaque = "planta" 
  const danioBase = 35
}

object alf {
  const pokemon = pokemonAlf
  
}

object pokemonAlf {
  var nombre = "wartortle"
  const tipo = "agua"
  var vida = 100
  var poderes =[pistolaDeAgua,placaje,mordisco,descanso]
   
}

object Lucas {
  const pokemon = pokemonLucas
  
}

object pokemonLucas {
  var nombre = "charmeleon"
  const tipo = "fuego"
  var vida = 100
  var poderes =[lanzallamas,mordisco,placaje,descanso]

}

object fede {
  const pokemon = pokemonFede
  
}

object pokemonFede {
  var nombre = "treecko"
  const tipo = "planta"
  var vida = 100
  var poderes =[latigoCepa,placaje,mordisco,descanso]

}