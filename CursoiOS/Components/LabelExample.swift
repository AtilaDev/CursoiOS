//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Leandro Favre on 17/11/2024.
//

import SwiftUI

struct LabelExample: View {
  var body: some View {
    Label("SWIFTUI", image: "swiftui")
    Label("SWIFTUI", systemImage: "figure.badminton")
    Label(
      title: { Text("CustomLogo") },
      icon: { Image("swiftui")
          .resizable()
          .scaledToFit()
          .frame(height: 30)
      }
    )
  }
}

#Preview {
  LabelExample()
}
