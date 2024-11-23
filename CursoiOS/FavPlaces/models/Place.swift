//
//  Place.swift
//  CursoiOS
//
//  Created by Leandro Favre on 22/11/2024.
//

import Foundation
import MapKit

struct Place:Identifiable{
  let id = UUID()
  var name:String
  var coordinates:CLLocationCoordinate2D
  var fav:Bool
}
