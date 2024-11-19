//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Leandro Favre on 17/11/2024.
//

import SwiftUI

struct TextFieldExample: View {
  @State var email = ""
  @State var password = ""
    var body: some View {
      VStack {
        TextField(text: $email, label: {
          Text("Escribe tu email")
        })
        .keyboardType(.emailAddress)
        .padding(16)
        .background(.gray.opacity(0.2))
        .cornerRadius(16)
        .padding(.horizontal, 32)
        .onChange(of: email, {oldValue, newValue in
          print("El antiguo valor era \(oldValue) y el nuevo es \(newValue)")
        })
        SecureField(text: $password, label: {
          Text("Escribe tu contraseña")
        })
        .keyboardType(.emailAddress)
        .padding(16)
        .background(.gray.opacity(0.2))
        .cornerRadius(16)
        .padding(.horizontal, 32)
        .onChange(of: password, {oldValue, newValue in
          print("El antiguo valor era \(oldValue) y el nuevo es \(newValue)")
        })
      }
        
    }
}

#Preview {
    TextFieldExample()
}
