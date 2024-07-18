//
//  ListExample.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 17/07/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmilion"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "AristiDevs"),
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon"),
    Digimon(name: "Aristimon"),
    Digimon(name: "Aristimon"),
    
]

struct ListExample: View {
    var body: some View {
        //        List{
        //            ForEach(pokemons, id:\.name) {pokemon in
        //                Text(pokemon.name)
        //            }
        //        }
        //        List(digimons) {digimon in
        //                Text(digimon.name)
        //            }
        
        List{
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id:\.name) {pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons){digimon in 
                    Text(digimon.name)}
            }
        }.listStyle(.automatic)
    }
}

struct Pokemon{
    let name:String        
}
struct Digimon: Identifiable{
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
