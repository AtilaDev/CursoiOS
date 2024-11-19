//
//  IMCResult.swift
//  CursoiOS
//
//  Created by Leandro Favre on 18/11/2024.
//

import SwiftUI

struct IMCResult: View {
  let userWeight:Double
  let userHeight:Double
  
  var body: some View {
    VStack{
      Text("Tu Resultado").font(.title).bold().foregroundColor(.white)
      let result = IMCCalculator.calculateImc(weight: userWeight, height: userHeight)
      InformationView(result: result)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundApp)
  }
}

#Preview {
  IMCResult(userWeight: 80, userHeight: 190)
}
