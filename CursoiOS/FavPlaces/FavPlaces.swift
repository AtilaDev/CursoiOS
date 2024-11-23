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
  @State var showPopUp:Bool = false
  @State var name:String = ""
  @State var favPlace:Bool = false
  
  var body: some View {
    ZStack{
      MapReader{ proxy in
        Map(position: $position)
          .onTapGesture {
            showPopUp = true
          }
      }
      if showPopUp {
        
        let view = VStack{
          Text("Añadir localización").font(.title2).bold().padding(.bottom, 16)
          TextField("Nombre", text: $name)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
          Toggle("¿Es un lugar favorito?", isOn: $favPlace).padding(.bottom, 24)
          Button("Guardar") {
            
          }
        }
        withAnimation{
          CustomDialog(closeDialog: {
            showPopUp = false
          }, onDismissOutside: false, content: view)
        }
      }
    }
  }
}

#Preview {
  FavPlaces()
}
