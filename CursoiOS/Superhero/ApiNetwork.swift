//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Leandro Favre on 21/11/2024.
//

import Foundation

class ApiNetwork {
  
  struct Wrapper:Codable{
    let response:String
    let results:[Superhero]
  }
  
  struct Superhero:Codable{
    let id:String
    let name:String
  }
  
  func getHeroesByQuery(query:String) async throws -> Wrapper{
    let url = URL(string: "https://superheroapi.com/api/7fe3d527dde897ac5105d4d529d07628/search/\(query)")!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
    return wrapper
  }
}
