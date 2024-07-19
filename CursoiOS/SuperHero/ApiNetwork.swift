//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 18/07/24.
//

import Foundation

class ApiNetwork{
    struct Wrapper: Codable{
        let response:String
          let results:[Superhero]
    }
  
    struct Superhero: Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperhero
        
    }
    
    struct ImageSuperhero:Codable{
        let url:String
    }
    
    func getHeroesByQery(query:String) async throws -> Wrapper{
        let api = "6d09801a84defd7db2861ff2347d028f"
        let url = URL(string: "https://superheroapi.com/api/\(api)/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
}
