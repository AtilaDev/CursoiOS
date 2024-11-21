//
//  SuperheroDetail.swift
//  CursoiOS
//
//  Created by Leandro Favre on 21/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
  let id:String
  
  @State var superhero:ApiNetwork.SuperheroCompleted? = nil
  @State var loading:Bool = true
  
  var body: some View {
    VStack{
      if loading {
        ProgressView().tint(.white)
      }else if let superhero = superhero{
        WebImage(url: URL(string: superhero.image.url))
          .resizable()
          .scaledToFill()
          .frame(height: 250)
          .clipped()
        Text(superhero.name).bold().font(.title).foregroundColor(.white)
        ForEach(superhero.biography.aliases, id: \.self){ alias in
          Text(alias).foregroundColor(.gray).italic()
        }
        SuperheroStats(stats: superhero.powerstats)
        Spacer()
      }
    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(
      .backgroundApp
    )
    .onAppear{
      loading = true
      Task{
        do{
          superhero = try await ApiNetwork().getHeroById(id: id)
        }catch{
          print("Error")
        }
        loading = false
      }
    }
  }
}

struct SuperheroStats: View {
  let stats:ApiNetwork.Powerstats
  
  var body: some View {
    VStack{
      Chart{
        let statsArray: [(String, Int)] = [
          ("Combat", Int(stats.combat) ?? 0),
          ("Durability", Int(stats.durability) ?? 0),
          ("Intelligence", Int(stats.intelligence) ?? 0),
          ("Power", Int(stats.power) ?? 0),
          ("Speed", Int(stats.speed) ?? 0),
          ("Strength", Int(stats.strength) ?? 0),
        ]
        
        ForEach(statsArray, id: \.0) { category, value in
          SectorMark(
            angle: .value("Count", value),
            innerRadius: .ratio(0.6),
            angularInset: 2
          )
          .cornerRadius(5)
          .foregroundStyle(by: .value("Category", category))
        }

      }
    }.padding(16)
      .frame(maxWidth: .infinity, maxHeight: 250)
      .background(.white)
      .cornerRadius(16)
      .padding(24)
  }
}

#Preview {
  SuperheroDetail(id: "1")
}
