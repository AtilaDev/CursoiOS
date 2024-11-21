//
//  SuperheroSearch.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct SuperheroSearch: View {
  @State var superheroName:String = ""
  var body: some View {
    VStack{
      TextField("", text: $superheroName, prompt:
        Text("Super hero name...")
        .font(.title2)
        .bold()
        .foregroundColor(.gray)
      )
      .font(.title2)
      .bold()
      .foregroundColor(.white)
      .padding(8)
      .border(.purple, width: 1.5)
      .autocorrectionDisabled()
      .onSubmit {
        print(superheroName)
        Task{
          do{
            let response = try await ApiNetwork().getHeroesByQuery(query: superheroName)
            print(response)
          }catch{
            print("Error")
          }
        }
      }
      Spacer()
      
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundApp)
  }
}

#Preview {
  SuperheroSearch()
}
