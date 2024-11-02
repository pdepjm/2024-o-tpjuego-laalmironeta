import wollok.game.*
import objetos.*

object juego {
  
  method iniciar() {
    self.hacerConfiguracionInicial()
    game.addVisualCharacter(entrenador)
    game.addVisual(alf)
    entrenador.iniciarPelea()
    
    
  }
  
 

  method hacerConfiguracionInicial() {
		game.title("PokeWollok")
		game.width(40)
		game.height(40) 
		game.boardGround("mapa2.png")
    } 

    method pelea() {
      game.addVisual(fondoPelea)
      game.addVisual(pokemonAlf)
      game.addVisual(pokemonNuestro)

      }
    method quitarPelea() {
      game.removeVisual(fondoPelea)
      game.removeVisual(pokemonAlf)
      game.removeVisual(pokemonNuestro)
    }  
}


