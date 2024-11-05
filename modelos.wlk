import objetos.*
class Pokemones {
    const property nombrePokemon
    const property tipoPokemon 
    var property hp 
    const property ataques
    const imagen   

    method image() = imagen

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

    method esDebilA(tipo) = tipo == planta or tipo == electrico
  
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

    method atacarAotro(rival) { rival.reducirVida(poderAtaque * self.multiplicador(rival)) 
      
    }
    
    
    
    
    
    method multiplicador(rival) =if (rival.esDebil(tipoAtaque)) 1.5 else 1
      
    
    
    

}

class Entrenadores {
    const property nombreEntrenador
    const property pokemonEntrenador   
    //puede elegir el ataque para su pokemon, o lo dejamos en pokemon
  
}




class Batallas {
    var property pokemon1 
    var property pokemon2
    var atacante = pokemon1  
    var defensor = pokemon2
    


    method pelea() {
        pokemon1.text()
        self.elegirAtaque()
        game.onTick(10000, "nose", self.ataqueRival()) 
        self.aparecerVida()
        


    }

    method elegirAtaque() {
        keyboard.f().onPressDo({self.ataca1(impactrueno)})
        keyboard.g().onPressDo({self.ataca1(placaje)})
        keyboard.h().onPressDo({self.ataca1(mordisco)})
        keyboard.j().onPressDo({self.ataca1(descanso)})
    
      
    }


   method aparecerVida() {
     game.addVisual(vida)
   }

    //parametrizar para ver cual es el atacante
    method ataca1(ataque) { if(atacante.turno() and pokemon1.ataques(ataque)) ataque.atacarAotro(pokemon2)
      
    } 
    
    
    
    method ataqueRival() = pokemon2.ataqueRandom()

    method ataca2() {
    if(defensor.turno()) pokemon1.hp(pokemon1.hp() - (pokemon2.ataqueRival()).poderAtaque())
    }

    method pelear(ataque) {
        self.ataca1(ataque) then (self.ataca2()) 
    }

    
    

    method turno() { 
    if(!self.batallaFinalizada()){
        var atacanteAuxiliar = atacante
        defensor = atacante
        atacante = atacanteAuxiliar
        self.turno()
    
   
    
       }

    }

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
  var  rival = charmander

  method elRival() {
    rival = pokemon2.batalla1()
    
  }

  var property position =  game.at(6, 6)
  method text() = "vida =" + pikachu.hp()
}

//pasar a objeto los tipos
const pikachu = new Pokemones(nombrePokemon = "Pikachu",tipoPokemon = "Electrico",hp = 100,ataques = [impactrueno,placaje,mordisco,descanso],imagen = "pikachu.png")
const bulbasaur = new Pokemones(nombrePokemon = "bulbasaur",tipoPokemon = "Planta",hp = 100,ataques = [latigoCepa,placaje,mordisco,descanso],imagen = "bulbasaur.png")
const charmander = new Pokemones(nombrePokemon = "charmander",tipoPokemon = "Fuego",hp = 100,ataques = [lanzaLLamas,placaje,mordisco,descanso],imagen = "charmander.png")
const squirtle = new Pokemones(nombrePokemon = "Squirtle",tipoPokemon = "Agua",hp = 100,ataques = [pistolaDeAgua,placaje,mordisco,descanso],imagen = "squirtle.png")   

const impactrueno = new Ataques(nombreAtaque = "impactrueno",tipoAtaque = "Electrico",poderAtaque = 35)
const placaje = new Ataques(nombreAtaque = "placaje",tipoAtaque = "normal",poderAtaque = 15)
const mordisco = new Ataques(nombreAtaque = "mordisco",tipoAtaque = "siniestro",poderAtaque = 25) 
const descanso = new Ataques(nombreAtaque = "descanso",tipoAtaque = "normal",poderAtaque = 0)
const latigoCepa = new Ataques(nombreAtaque = "latigo cepa",tipoAtaque = "planta",poderAtaque = 35)
const lanzaLLamas = new Ataques(nombreAtaque = "lanza llamas",tipoAtaque = "fuego",poderAtaque = 35)
const pistolaDeAgua = new Ataques(nombreAtaque = "pistola de agua",tipoAtaque = "agua",poderAtaque = 35)

const batalla1 = new Batallas(pokemon1 = pikachu,pokemon2 = bulbasaur)
const batalla2 = new Batallas(pokemon1 = pikachu,pokemon2 = charmander)
const batalla3 = new Batallas(pokemon1 = pikachu,pokemon2 = squirtle)

const naza = new Entrenadores(nombreEntrenador = "Naza",pokemonEntrenador = pikachu)
const alf = new Entrenadores(nombreEntrenador = "Alf",pokemonEntrenador = charmander)
const lucas = new Entrenadores(nombreEntrenador = "Lucas",pokemonEntrenador = squirtle)
const ivo = new Entrenadores(nombreEntrenador = "Ivo",pokemonEntrenador = bulbasaur)


//falta barra de vida, adaptar imagenes, turnos y multiplicadores
