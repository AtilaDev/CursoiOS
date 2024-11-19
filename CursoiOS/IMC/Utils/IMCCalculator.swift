//
//  IMCCalculator.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import Foundation
import SwiftUI

struct IMCCalculator {
  static func calculateImc(weight:Double, height:Double) -> Double {
    let result = weight / ((height/100)*(height/100))
    return result
  }
  
  static func getImcResult(result:Double) -> (String, String, Color) {
    let title:String
    let description:String
    let color:Color
    
    switch result {
      case 0.00...19.99:
        title = "Peso bajo"
        description = "Estás por debajo del peso recomendado según el IMC."
        color = .yellow
      case 20.00...24.99:
        title = "Peso normal"
        description = "Estás en el peso recomendado según el IMC."
        color = .green
      case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estás por encima del peso recomendado según el IMC."
        color = .orange
      case 30.00...100:
        title = "Obesidad"
        description = "Estás muy por encima del peso recomendado según el IMC."
        color = .red
      default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = .gray
    }
    return (title, description, color)
  }

}
