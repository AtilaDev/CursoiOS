//
//  FavPlaces.swift
//  CursoiOS
//
//  Created by Leandro Favre on 22/11/2024.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
  
  @State var position = MapCameraPosition.region(
    MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 36.755306 , longitude: -4.424076),
      span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
  )
  
  @State var places:[Place] = []
//  @State var showPopUp:Bool = false
  @State var showPopUp:CLLocationCoordinate2D? = nil
  @State var name:String = ""
  @State var favPlace:Bool = false
  
  var body: some View {
    ZStack{
      MapReader{ proxy in
        Map(position: $position)
          .onTapGesture { coords in
            if let coordinates = proxy.convert(coords, from: .local){
              showPopUp = coordinates
            }
          }
      }
      if showPopUp != nil {
        
        let view = VStack{
          Text("Añadir localización").font(.title2).bold().padding(.bottom, 16)
          TextField("Nombre", text: $name)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
          Toggle("¿Es un lugar favorito?", isOn: $favPlace).padding(.bottom, 24)
          Button("Guardar") {
            savePlace(name: name, fav: favPlace, coordinates: showPopUp!)
          }
        }
        withAnimation{
          CustomDialog(closeDialog: {
            showPopUp = nil
          }, onDismissOutside: false, content: view)
        }
      }
    }
  }
  
  func savePlace(name:String, fav:Bool, coordinates: CLLocationCoordinate2D){
    let place = Place(name: name, coordinates: coordinates, fav: favPlace)
    places.append(place)
  }
}

#Preview {
  FavPlaces()
}
