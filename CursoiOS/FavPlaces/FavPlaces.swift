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
  
  var body: some View {
    ZStack{
      MapReader{ proxy in
        Map(position: $position)
          .onTapGesture {
//
          }
        
      }
    }
  }
}

#Preview {
  FavPlaces()
}
