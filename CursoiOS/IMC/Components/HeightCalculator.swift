//
//  HeightCalculator.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct HeightCalculator: View {
  @Binding var selectedHeight:Double
  
  var body: some View {
    VStack{
      TitleText(text: "Altura")
      InformationText(text: "\(Int(selectedHeight)) cm")
      Slider(value: $selectedHeight, in:100...220, step: 1)
        .accentColor(.purple)
        .padding(.horizontal, 16)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundComponent)
    .cornerRadius(16)
  }
}
