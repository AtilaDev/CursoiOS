//
//  SuperheroSearch.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct SuperheroSearch: View {
  @State var superheroName:String = ""
  @State var wrapper:ApiNetwork.Wrapper? = nil
  
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
            wrapper = try await ApiNetwork()
              .getHeroesByQuery(query: superheroName)
          }catch{
            print("Error")
          }
        }
      }
      List(wrapper?.results ?? []){ superhero in
        SuperheroItem(superhero: superhero)
      }
      .listStyle(.plain)
      
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundApp)
  }
}

struct SuperheroItem: View {
  let superhero:ApiNetwork.Superhero
  
  var body: some View {
    ZStack{
      Rectangle()
      VStack{
        Spacer()
        Text(superhero.name)
          .foregroundColor(.white)
          .font(.title)
          .bold()
          .padding()
          .frame(maxWidth: .infinity)
          .background(.white.opacity(0.5))
      }
    }
    .frame(height: 200)
    .cornerRadius(32)
    .listRowBackground(Color.backgroundApp)
  }
}



#Preview {
//  SuperheroItem(superhero: ApiNetwork.Superhero(id: "", name: "Ary"))
  SuperheroSearch()
}
