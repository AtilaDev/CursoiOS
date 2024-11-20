//
//  ListExample.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

var pokemons = [
  Pokemon(name: "Poke1"),
  Pokemon(name: "Poke2"),
  Pokemon(name: "Poke3"),
  Pokemon(name: "Poke4"),
  Pokemon(name: "Poke5")
]

var digimons = [
  Digimon(name: "Poke1"),
  Digimon(name: "Poke2"),
  Digimon(name: "Poke3"),
  Digimon(name: "Poke4"),
  Digimon(name: "Poke5"),
  Digimon(name: "Poke5"),
  Digimon(name: "Poke5")
]

struct ListExample: View {
  var body: some View {
    //      List{
    //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //      }
    //      List{
    //        ForEach(pokemons, id: \.name) { pokemon in
    //          /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
    //        }
    //      }
    //      List(digimons) { digimon in
    //        Text(digimon.name)
    //
    //      }
    List{
      Section(header: Text("Pokemons"), content: {
        ForEach(pokemons, id: \.name) { pokemon in
          /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
        }
      })
      Section(header: Text("Digimons"), content: {
        ForEach(digimons) { digimon in
          Text(digimon.name)
        }
      })
    }.listStyle(.automatic)
  }
}

struct Pokemon {
  let name:String
}

struct Digimon: Identifiable {
  var id = UUID()
  let name:String
}

#Preview {
  ListExample()
}
