//
//  SuperheroSearch.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearch: View {
  @State var superheroName:String = ""
  @State var wrapper:ApiNetwork.Wrapper? = nil
  @State var loading:Bool = false
  
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
        loading = true
        print(superheroName)
        Task{
          do{
            wrapper = try await ApiNetwork()
              .getHeroesByQuery(query: superheroName)
          }catch{
            print("Error")
          }
          loading = false
        }
      }
      if loading {
        ProgressView().tint(.white)
      }
      NavigationStack{
        List(wrapper?.results ?? []){ superhero in
          ZStack{
            SuperheroItem(superhero: superhero)
            NavigationLink(destination: SuperheroDetail()) {EmptyView()}
              .opacity(0)
          }.listRowBackground(Color.backgroundApp)
        }.listStyle(.plain)
      }
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
      WebImage(url: URL(string: superhero.image.url))
        .resizable()
        .indicator(.activity)
        .scaledToFill()
        .frame(height: 200)
      
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
  }
}



#Preview {
  //  SuperheroItem(superhero: ApiNetwork.Superhero(id: "", name: "Ary"))
  SuperheroSearch()
}
