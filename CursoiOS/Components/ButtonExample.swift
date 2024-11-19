//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Leandro Favre on 17/11/2024.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
      Counter()
    }
}

struct Counter:View {
  @State var numSuscritores = 0
  
  var body: some View {
    Button(action: {
      numSuscritores += 1
    }, label: {
      Text("Suscriptores: \(numSuscritores)")
        .bold()
        .font(.title)
        .foregroundColor(.white)
        .frame(height: 50)
        .background(.red)
        .cornerRadius(10)
    })
  }
}

#Preview {
    ButtonExample()
}
