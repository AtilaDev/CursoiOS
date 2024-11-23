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
  @State var showPopUp:CLLocationCoordinate2D? = nil
  @State var name:String = ""
  @State var favPlace:Bool = false
  @State var showSheet:Bool = false
  
  let height = stride(from: 0.3, through: 0.3, by: 0.1).map{
    PresentationDetent.fraction($0)
  }
  
  var body: some View {
    ZStack{
      MapReader{ proxy in
        Map(position: $position){
          ForEach(places){ place in
            Annotation(place.name, coordinate: place.coordinates){
              let color = if place.fav {Color.green}else{Color.red}
              Circle()
                .stroke(color, lineWidth: 10)
                .fill(.white)
                .frame(width: 25, height: 25)
            }
          }
        }
        .onTapGesture { coords in
          if let coordinates = proxy.convert(coords, from: .local){
            showPopUp = coordinates
          }
        }
        .overlay{
          VStack{
            Button("Show list"){
              showSheet = true
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.white)
            .cornerRadius(16)
            .padding(16)
            Spacer()
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
            .autocorrectionDisabled()
          Toggle("¿Es un lugar favorito?", isOn: $favPlace).padding(.bottom, 24)
          Button("Guardar") {
            savePlace(name: name, fav: favPlace, coordinates: showPopUp!)
            clearForm()
          }.disabled(name == "")
        }
        withAnimation{
          CustomDialog(closeDialog: {
            showPopUp = nil
          }, onDismissOutside: false, content: view)
        }
      }
    }.sheet(
      isPresented: $showSheet,
      content: {
        ScrollView(.horizontal){
          LazyHStack{
            ForEach(places){ place in
              let color = if place.fav {Color.green.opacity(0.5)}else{
                Color.red.opacity(0.5)
              }
              VStack{
                Text(place.name).font(.title3).bold()
                
              }
              .frame(width: 150, height: 100)
              .overlay{
                RoundedRectangle(cornerRadius: 20)
                  .stroke(color, lineWidth: 1)
              }
              .shadow(radius: 1).padding(.horizontal, 8)
              .onTapGesture(perform: {
                animateCamera(coordinate: place.coordinates)
                showSheet = false
              })
              
            }
          }
        }.presentationDetents(Set(height))
      }
    ).onAppear{
      loadPlaces()
    }
  }
  
  func animateCamera(coordinate:CLLocationCoordinate2D){
    withAnimation{
      position = MapCameraPosition.region(
        MKCoordinateRegion(
          center: coordinate,
          span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
      )
    }
  }
  
  func savePlace(name:String, fav:Bool, coordinates: CLLocationCoordinate2D){
    let place = Place(name: name, coordinates: coordinates, fav: favPlace)
    places.append(place)
    savePlaces()
  }
  
  func clearForm() {
    showPopUp = nil
    name = ""
    favPlace = false
  }
}

#Preview {
  FavPlaces()
}

extension FavPlaces{
  func savePlaces(){
    if let encodeData = try? JSONEncoder().encode(places){
      UserDefaults.standard.set(encodeData, forKey: "places")
    }
  }
  
  func loadPlaces(){
    if let savedPlaces = UserDefaults.standard.data(forKey: "places"),
       let decodedPlaces = try? JSONDecoder().decode([Place].self, from: savedPlaces){
      places = decodedPlaces
    }
  }
}
