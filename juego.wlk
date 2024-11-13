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
		game.width(15)
		game.height(11) 
		game.boardGround("mapa3.jpg")
    } 


}


