class Pokemones {
    const property nombrePokemon
    const property tipoPokemon 
    var property hp 
    const property ataques 




    method esDebil(tipo) = tipoPokemon.esDebilA(tipo)

    method reducirVida(resto) { hp = hp - resto  
      
    }

    method seleccionarAtaque(numero) = if (1 >= numero >= 4)ataques.drop(numero)   


    
    
    method perdio() = self.hp() <= 0

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

    //parametrizar para ver cual es el atacante
    method ataca1(ataque) { ataque.atacarAotro(pokemon2)
      
    } 

    method ataca2(ataque) { if(pokemon2.ataques(ataque)) pokemon1.hp(pokemon1.hp() - ataque.poderAtaque())


    }

    method turno() { 
    if(!self.batallaFinalizada()){atacante.ataca1()
        var atacanteAuxiliar = atacante
        defensor = atacante
        atacante = atacanteAuxiliar
        self.turno()
    
    
    
       }


    }


    method batallaFinalizada() = pokemon1.perdio() or pokemon2.perdio() 
}


//pasar a objeto los tipos
const pikachu = new Pokemones(nombrePokemon = "Pikachu",tipoPokemon = "Electrico",hp = 100,ataques = [impactrueno,placaje,mordisco,descanso])
const bulbasaur = new Pokemones(nombrePokemon = "bulbasaur",tipoPokemon = "Planta",hp = 100,ataques = [latigoCepa,placaje,mordisco,descanso])
const charmander = new Pokemones(nombrePokemon = "charmander",tipoPokemon = "Fuego",hp = 100,ataques = [lanzaLLamas,placaje,mordisco,descanso])
const squirtle = new Pokemones(nombrePokemon = "Squirtle",tipoPokemon = "Agua",hp = 100,ataques = [pistolaDeAgua,placaje,mordisco,descanso])   

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
