//
//  InformationView.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct InformationView: View {
  let result:Double
  
  var body: some View {
    let information = IMCCalculator.getImcResult(result: result)
    
    VStack{
      Spacer()
      Text(information.0)
        .foregroundColor(information.2)
        .font(.title)
        .bold()
      Spacer()
      Text("\(result, specifier: "%.2f")")
        .font(.system(size: 80))
        .bold()
        .foregroundColor(.white)
      Spacer()
      Text(information.1)
        .font(.title2)
        .foregroundColor(.white)
        .padding(.horizontal, 8)
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundComponent)
    .cornerRadius(16)
    .padding(16)
  }
}
