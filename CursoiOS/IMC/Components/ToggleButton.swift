//
//  ToggleButton.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct ToggleButton: View {
  let text:String
  let imageName:String
  let gender:Int
  @Binding var selectedGender:Int
  
  var body: some View {
    let color = if gender == selectedGender {
      Color.backgroundComponentSelected
    } else {
      Color.backgroundComponent
    }
    
    Button(action: {
      selectedGender = gender
    }, label: {
      VStack{
        Image(systemName: imageName)
          .resizable()
          .scaledToFit()
          .frame(height: 100)
          .foregroundColor(.white)
        InformationText(text: text)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(color)
    }).cornerRadius(16)
  }
}
