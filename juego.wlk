import pepita.*
import wollok.game.*
import objetos.*
object juego {
  
  method iniciar() {
    game.title("PokeWollok")
	  game.height(10)
	  game.width(10)
	  game.cellSize(100)
  	game.addVisual(mapa)
    //keyboard.e().onPressDo({entrenador.pelear(alf)})
  }
  
  
}


