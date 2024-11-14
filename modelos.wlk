import juego.*

class Pokemon {
    var property tipoPokemon 
    var property hp 
    var property ataques
    var property imagenPokemon
    var property position   

    method image() = imagenPokemon

    method reducirVida(resto){
      hp = hp - resto

    }

    method ataqueRandom() = ataques.anyOne()

    method esDebil(tipo) = tipoPokemon.esDebilA(tipo)

    method perdio() = self.hp() <= 0

}
object fuego {
    method esDebilA(agua) = true

}
object agua {
    method esDebilA(tipo) = tipo == planta or tipo == electrico
}

object planta {
    method esDebilA(fuego) = true
  
}

object electrico {

    method esDebilA(roca) = true
  
}

object normal{

  method esDebilA(lucha) = true
}

object siniestro {
  method esDebilA(lucha) = true 
  
}

class Ataque {
    var property tipoAtaque 
    var property poderAtaque
    var property sonidoAtaque

    method play() {
      game.sound(sonidoAtaque).play()
    } 

    method atacarAotro(rival) { rival.reducirVida(self.poderAtaque() * self.multiplicador(rival)) 
      
    }
    
    method multiplicador(rival) = if (rival.esDebil(tipoAtaque)) 1.5 else 1

}

class Entrenador {
    var property pokemonEntrenador  
    var property imagenEntrenador
    var property position  
    method image() = imagenEntrenador
  
}

class Protagonista inherits Entrenador {

    
    method mover() {
      position = game.at(11,1)
    } 

    method dialogos(){
    game.onCollideDo(alf,{elemento => self.consultarAlf()}) 
    game.onCollideDo(lucas,{elemento => self.consultarLucas()}) 
    game.onCollideDo(ivo,{elemento => self.consultarIvo()})
  }

   method pelearConAlf() {
      game.onCollideDo(alf, {elemento => batalla.inicializarPeleaAlf()})
    }



    method pelearConLucas() {
      game.onCollideDo(lucas, {elemento => batalla.inicializarPeleaLucas()})
    }

   



  method consultarAlf() {
    game.say(alf,"Si me queres enfrentar, preparate para conocer la muerte apretando la Z")
  }
  method consultarLucas() {
    game.say(lucas,"Es hora de darte catedra de esto, toca la E si te animas")
  }

  method consultarIvo() {
    game.say(ivo,"Hoy soy el ayudante de la muerte, toca Y")
  }

  


}

object tituloBattle {
  var property position = game.at(5,12)
  method image() = "barraAtaquePikachu.png"
}


object fondoPelea {
  var property position = game.origin()
  method image() = "escenarioFinal2.jpg"
}
object barraMenu {
  var property position = game.at(1,1)
  method image() = "barraAtaquePikachu.png"
}

object pokebola {
 method play() {
   game.sound("sonidoPokebola.mp3").play()
 }




}
object batalla {
    var property nosotros = naza 
    var property rival = alf
    var property pokemon1 = nosotros.pokemonEntrenador()
    var property pokemon2 = rival.pokemonEntrenador() 
    var property turnoAtacante = true   
    var property sonido = game.sound("musicaBatalla.mp3")
    var property vidaRival = "vida =" + pokemon2.hp()


      method inicializarPeleaLucas() { 
      keyboard.e().onPressDo({ self.setearLucas() self.pelear()})
      }
      method inicializarPeleaAlf() { 
      keyboard.z().onPressDo({ self.setearAlf() self.pelear()})
      }
      method inicializarPeleaIvo() { 
      keyboard.y().onPressDo({ self.setearIvo() self.pelear()})
      }



    method setearLucas(){
      rival = lucas
      pokemon2 = charmander
      nosotros = naza
      pokemon1 = pikachu
    }

    method setearAlf(){
      rival = alf
      pokemon2 = squirtle
      nosotros = naza
      pokemon1 = pikachu
    }

    method setearIvo(){
      rival = ivo
      pokemon2 = bulbasaur
      nosotros = naza
      pokemon1 = pikachu
    }

    method inicializarPeleas() { 
      keyboard.e().onPressDo({self.pelear()})
      
    }

   //  method inicializarPelea2() { 
     // keyboard.e().onPressDo({self.pelear()})
      
 //   }

    method pelear() {
     
      game.addVisual(fondoPelea)
      game.addVisual(tituloBattle)
      game.addVisual(pokemon2)
      game.addVisual(pokemon1)
      game.addVisual(barraMenu)
      self.elegirAtaque()
      pokebola.play()
      sonido.play()
      sonido.shouldLoop(true)
      //vida.verVida()
      }

    


    method quitarPelea() {
      game.removeVisual(fondoPelea)
      game.removeVisual(tituloBattle)
      game.removeVisual(pokemon2)
      game.removeVisual(pokemon1)
      game.removeVisual(barraMenu)
      sonido.stop()
      naza.mover()
      game.removeVisual(rival)
      rival = null
      nosotros = null

    

    }  
    method pelea() {
        //pokemon1.text()
        self.elegirAtaque()
        self.aparecerVida()
         }

   method aparecerVida() {
     game.addVisual(vida)
   }

    method ataca1(ataque) { if(self.turnoAtacante()) ataque.atacarAotro(pokemon2) ataque.play() 
      
    } 
    
          


    method ataca2() {
    if(!self.turnoAtacante()) pokemon1.hp(pokemon1.hp() - (pokemon2.ataqueRandom()).poderAtaque()) (pokemon2.ataqueRandom()).play()
    }

   
    
    method alternarTurno(){
    if(turnoAtacante) turnoAtacante = false else turnoAtacante = true
    }



    method elegirAtaque() {
    keyboard.f().onPressDo({self.ataca1(impactrueno)                        
                            self.alternarTurno()
                            game.onTick(3000,"espera pa",{self.ataca2()})
                            self.alternarTurno()
                            if (self.batallaFinalizada()) pokemon1.hp(100) self.quitarPelea()})
    keyboard.g().onPressDo({self.ataca1(placaje)
                            placaje.play()
                            self.alternarTurno()
                            self.ataca2()
                            game.schedule(5000,{self.alternarTurno()})
                            if (self.batallaFinalizada()) self.quitarPelea()})
    keyboard.h().onPressDo({self.ataca1(mordisco)
                            mordisco.play()
                            self.alternarTurno()
                            self.ataca2()
                            game.schedule(5000,{self.alternarTurno()})
                            if (self.batallaFinalizada()) self.quitarPelea()})
    keyboard.j().onPressDo({self.ataca1(descanso)
                            descanso.play()
                            self.alternarTurno()
                            self.ataca2()
                            game.schedule(5000,{self.alternarTurno()})
                            if (self.batallaFinalizada()) self.quitarPelea()})
    }
    

 
    method resetVida(){
        if(self.batallaFinalizada()) pokemon1.hp(100)
    }
   
    method batallaFinalizada() = pokemon1.perdio() or pokemon2.perdio() 
}

object vida {
  var property position =  game.at(6, 6)
  method text() = "vida =" + pikachu.hp()
  method verVida() {
    game.say(self, self.text())
    
  }
}

object vidaRival {

//  var  rival = charmander
  var property position =  game.at(6, 6)
  //var vida = 
}


const pikachu = new Pokemon(tipoPokemon = electrico,hp = 100,ataques = [impactrueno,placaje,mordisco,descanso],imagenPokemon = "pikachu5.gif", position = game.at(2,3))
const bulbasaur = new Pokemon(tipoPokemon = planta,hp = 100,ataques = [latigoCepa,placaje,mordisco,descanso],imagenPokemon = "bulbasaur.png", position = game.at(2,10))
const charmander = new Pokemon(tipoPokemon = fuego,hp = 100,ataques = [lanzaLLamas,placaje,mordisco,descanso],imagenPokemon = "charmander5.gif",position = game.at(11, 5))
const squirtle = new Pokemon(tipoPokemon = agua ,hp = 100,ataques = [pistolaDeAgua,placaje,mordisco,descanso],imagenPokemon = "squirtle.gif",position = game.at(11, 5))   

const impactrueno = new Ataque(tipoAtaque = electrico,poderAtaque = 35,sonidoAtaque = "sonidoElectrico.mp3")
const placaje = new Ataque(tipoAtaque = "normal",poderAtaque = 15, sonidoAtaque = "sonidoPlacaje.mp3")
const mordisco = new Ataque(tipoAtaque = "siniestro",poderAtaque = 25,sonidoAtaque = "sonidoMordido.mp3") 
const descanso = new Ataque(tipoAtaque = "normal",poderAtaque = 1, sonidoAtaque ="")
const latigoCepa = new Ataque(tipoAtaque = planta,poderAtaque = 35, sonidoAtaque = "sonidoLatigo.mp3")
const lanzaLLamas = new Ataque(tipoAtaque = fuego,poderAtaque = 35, sonidoAtaque ="")
const pistolaDeAgua = new Ataque(tipoAtaque = agua,poderAtaque = 35, sonidoAtaque ="")

const naza = new Protagonista(pokemonEntrenador = pikachu, imagenEntrenador= "protagonista.png", position = game.at(11,1))
const alf = new Entrenador(pokemonEntrenador = squirtle, imagenEntrenador= "alfredo.png", position = game.at(8, 7))
const lucas = new Entrenador(pokemonEntrenador = charmander, imagenEntrenador = "lucasS.png", position= game.at(13, 7))
const ivo = new Entrenador(pokemonEntrenador = bulbasaur, imagenEntrenador = "ivan.png", position = game.at(3,3))


