//
//  IMCCalculateButton.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct IMCCalculateButton: View {
  let userWeight:Double
  let userHeight:Double
  
  var body: some View {
    NavigationStack{
      NavigationLink(destination: IMCResult(userWeight: userWeight, userHeight: userHeight), label: {
        Text("Calcular")
          .font(.title)
          .bold()
          .foregroundColor(.purple)
          .frame(maxWidth: .infinity, maxHeight: 100)
          .background(.backgroundComponent)
      })
      
    }
  }
}
