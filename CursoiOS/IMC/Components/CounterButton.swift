//
//  CounterButton.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct CounterButton: View {
  let text:String
  @Binding var number:Int
  
  var body: some View {
    VStack{
      TitleText(text: text)
      InformationText(text: String(number))
      HStack{
        Button(action: {
          if number > 0 {
            number -= 1
          }
        }, label: {
          ZStack{
            Circle()
              .frame(width: 70, height: 70)
              .foregroundColor(.purple)
            Image(systemName: "minus")
              .resizable()
              .scaledToFit()
              .frame(width: 25, height: 25)
              .foregroundColor(.white)
          }
        })
        Button(action: {
          if number < 100 {
            number += 1
          }
        }, label: {
          ZStack{
            Circle()
              .frame(width: 70, height: 70)
              .foregroundColor(.purple)
            Image(systemName: "plus")
              .resizable()
              .frame(width: 25, height: 25)
              .foregroundColor(.white)
          }
        })
      }.padding(.horizontal, 16)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundComponent)
    .cornerRadius(16)
  }
}
