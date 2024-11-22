//
//  MapExample.swift
//  CursoiOS
//
//  Created by Leandro Favre on 21/11/2024.
//

import SwiftUI
import MapKit

struct MapExample: View {
  @State var position = MapCameraPosition.region(
    MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude:-31.3762564, longitude:-64.4724914),
      span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    )
  )
  
  var body: some View {
    ZStack{
      Map(position: $position)
        .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
//        .onMapCameraChange(frequency: .continuous) { context in
//          print(context.region)
//        }
        .onMapCameraChange { context in
          print(context.region)
        }
      
      VStack{
        Spacer()
        HStack{
          Button(action: {
            withAnimation{
              position = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude:-31.4213797, longitude:-64.4971688),
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
              ))
            }
          }, label: {
            Text("Ir al Sur")
              .bold()
              .foregroundColor(.black)
              .padding()
              .background(.white)
              .cornerRadius(10)
              .padding()
          })
          
          Button(action: {
            withAnimation{
              position = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude:-31.3497667, longitude:-64.4755412),
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
              ))
            }
          }, label: {
            Text("Ir al Norte")
              .bold()
              .foregroundColor(.black)
              .padding()
              .background(.white)
              .cornerRadius(10)
              .padding()
          })
        }
      }
      
    }
  }
}

#Preview {
  MapExample()
}
