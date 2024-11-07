import wollok.game.*
import objetos.*
import modelos.*

object juego {
  
  method iniciar() {
    self.hacerConfiguracionInicial()
    game.addVisualCharacter(naza)
    game.addVisual(alf)
    game.addVisual(lucas)
    naza.iniciarPelea()
  
    
    
  }
  
 

  method hacerConfiguracionInicial() {
		game.title("PokeWollok")
		game.width(40)
		game.height(40) 
		game.boardGround("mapa2.png")
    } 


}


