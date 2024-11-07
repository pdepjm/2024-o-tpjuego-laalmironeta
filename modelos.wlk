import juego.*

class Pokemones {
    const property nombrePokemon
    const property tipoPokemon 
    var property hp 
    const property ataques
    const property imagenPokemon
    var property position   

    method image() = imagenPokemon

    method ataqueRandom() = ataques.anyOne()

    method esDebil(tipo) = tipoPokemon.esDebilA(tipo)

    method reducirVida(resto) { hp = hp - resto  
      
    }
  
    method perdio() = self.hp() <= 0

    method text() = "Apreta f para impactrueno, g para placaje, h para mordisco , j para descanso"

}


object fuego {

    method esDebilA(tipo) = tipo == agua

}

object agua {

    method esDebilA(tipo) = tipo == electrico or tipo == planta 
}

object planta {

    method esDebilA(tipo) = tipo == fuego 
  
}

object electrico {

    method esDebilA(tipo) = false
  
}

class Ataques {
    const property nombreAtaque
    const property tipoAtaque 
    const property poderAtaque

    method atacarAotro(rival) { rival.reducirVida(self.poderAtaque() * self.multiplicador(rival)) 
      
    }
    
    
    
    
    
    method multiplicador(rival) =if (rival.esDebil(tipoAtaque)) 1.5 else 1
      
    
    
    

}

class Entrenadores {
    const property nombreEntrenador
    const property pokemonEntrenador  
    const property imagenEntrenador
    var property position  
    //puede elegir el ataque para su pokemon, o lo dejamos en pokemon
    method image() = imagenEntrenador
  
}

class Protagonista inherits Entrenadores {

method iniciarPelea() {
    game.onCollideDo(alf,{elemento => self.consultarPelea(batalla3)}) 
    game.onCollideDo(lucas,{elemento => self.consultarPelea(batalla2)}) 
 
  }

  


  method consultarPelea(batalla) {

    keyboard.e().onPressDo({batalla.pelear()})
    //game.say(alf,"Si quieres enfrentar al maestro, preparate para conocer a la muerte apretando la E")
  }

}

object fondoPelea {
  var property position = game.origin()
  method image() = "fondoPelea6.png"
}

class Batallas {
    
    var property pokemon1 
    var property pokemon2
    var property turnoAtacante = true   

    method pelear() {
      
      game.addVisual(fondoPelea)
      game.addVisual(pokemon2)
      game.addVisual(pokemon1)
      self.elegirAtaque()
      


      }
    method quitarPelea() {
      game.removeVisual(fondoPelea)
      game.removeVisual(pokemon2)
      game.removeVisual(pokemon1)

    }  






    method pelea() {
        //pokemon1.text()
        self.elegirAtaque()
        self.aparecerVida()
         }




   method aparecerVida() {
     game.addVisual(vida)
   }

    //parametrizar para ver cual es el atacante
    method ataca1(ataque) { if(self.turnoAtacante()) ataque.atacarAotro(pokemon2)
      
    } 
    
    
    


    method ataca2() {
    if(!self.turnoAtacante()) pokemon1.hp(pokemon1.hp() - (pokemon2.ataqueRandom()).poderAtaque())
    }

   
    
    method alternarTurno(){
    turnoAtacante = !turnoAtacante   
    }



    method elegirAtaque() {
    keyboard.f().onPressDo({self.ataca1(impactrueno)
                                self.alternarTurno()
                                game.schedule(5000, {self.ataca2()})
                                self.alternarTurno()
                                if (self.batallaFinalizada()) self.quitarPelea()})
    keyboard.g().onPressDo({self.ataca1(placaje)
                                self.alternarTurno()
                                game.schedule(5000, {self.ataca2()})
                                self.alternarTurno()})
    keyboard.h().onPressDo({self.ataca1(mordisco)
                                self.alternarTurno()
                                game.schedule(5000, {self.ataca2()})
                                self.alternarTurno()})
    keyboard.j().onPressDo({self.ataca1(descanso)
                                self.alternarTurno()
                                game.schedule(5000, {self.ataca2()})
                                self.alternarTurno()})
    
      
    }
    

   /* method turno() { 
    if(!self.batallaFinalizada()){
        var atacanteAuxiliar = atacante
        defensor = atacante
        atacante = atacanteAuxiliar
        self.turno()
    
   
    
       }

    }
*/
    method resetVida(){
        if(self.batallaFinalizada()) pokemon1.hp(100)
    }
   
    method batallaFinalizada() = pokemon1.perdio() or pokemon2.perdio() 
}



    
object vida {
  var property position =  game.at(6, 6)
  method text() = "vida =" + pikachu.hp()
}

object vidaRival {

//  var  rival = charmander
  var property position =  game.at(6, 6)
  method text() = "vida =" + pikachu.hp()
}

//pasar a objeto los tipos
const pikachu = new Pokemones(nombrePokemon = "Pikachu",tipoPokemon = electrico,hp = 100,ataques = [impactrueno,placaje,mordisco,descanso],imagenPokemon = "pikachu.png", position = game.at(2,10))
//const bulbasaur = new Pokemones(nombrePokemon = "bulbasaur",tipoPokemon = "Planta",hp = 100,ataques = [latigoCepa,placaje,mordisco,descanso],imagenPokemon = "bulbasaur.png", position = game.at(2,10))
const charmander = new Pokemones(nombrePokemon = "charmander",tipoPokemon = fuego,hp = 100,ataques = [lanzaLLamas,placaje,mordisco,descanso],imagenPokemon = "charmander.png",position = game.at(23, 16))
const squirtle = new Pokemones(nombrePokemon = "Squirtle",tipoPokemon = agua ,hp = 100,ataques = [pistolaDeAgua,placaje,mordisco,descanso],imagenPokemon = "squirtle.png",position = game.at(23, 16))   

const impactrueno = new Ataques(nombreAtaque = "impactrueno",tipoAtaque = electrico,poderAtaque = 35)
const placaje = new Ataques(nombreAtaque = "placaje",tipoAtaque = "normal",poderAtaque = 15)
const mordisco = new Ataques(nombreAtaque = "mordisco",tipoAtaque = "siniestro",poderAtaque = 25) 
const descanso = new Ataques(nombreAtaque = "descanso",tipoAtaque = "normal",poderAtaque = 0)
const latigoCepa = new Ataques(nombreAtaque = "latigo cepa",tipoAtaque = planta,poderAtaque = 35)
const lanzaLLamas = new Ataques(nombreAtaque = "lanza llamas",tipoAtaque = fuego,poderAtaque = 35)
const pistolaDeAgua = new Ataques(nombreAtaque = "pistola de agua",tipoAtaque = agua,poderAtaque = 35)

//onst batalla1 = new Batallas(pokemon1 = pikachu,pokemon2 = bulbasaur, desafiante = ivo)
const batalla2 = new Batallas(pokemon1 = pikachu,pokemon2 = charmander)
const batalla3 = new Batallas(pokemon1 = pikachu,pokemon2 = squirtle)

const naza = new Protagonista(nombreEntrenador = "Naza",pokemonEntrenador = pikachu, imagenEntrenador= "entrenador2.png", position = game.center())
const alf = new Entrenadores(nombreEntrenador = "Alf",pokemonEntrenador = squirtle, imagenEntrenador= "alf2.png", position = game.at(4, 23))
const lucas = new Entrenadores(nombreEntrenador = "Lucas",pokemonEntrenador = charmander, imagenEntrenador= "lucas.png", position= game.at(27, 27))
//const ivo = new Entrenadores(nombreEntrenador = "Ivo",pokemonEntrenador = bulbasaur)


//falta barra de vida, adaptar imagenes, turnos y multiplicadores
