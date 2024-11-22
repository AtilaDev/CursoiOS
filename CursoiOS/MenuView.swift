//
//  MenuView.swift
//  CursoiOS
//
//  Created by Leandro Favre on 17/11/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
      NavigationStack{
        List{
          NavigationLink(destination: IMCView(), label: {
            Text("IMC Calculator")
          })
          NavigationLink(destination: SuperheroSearch(), label: {
            Text("Superhero Search")
          })
          NavigationLink(destination: FavPlaces(), label: {
            Text("Fav Places")
          })
        }
      }
    }
}

#Preview {
    MenuView()
}
