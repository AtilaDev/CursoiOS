//
//  TextExample.swift
//  CursoiOS
//
//  Created by Leandro Favre on 17/11/2024.
//

import SwiftUI

struct TextExample: View {
  var body: some View {
    VStack {
      Text("Hello, World!").font(.headline)
      Text( "Custom" )
        .font(.system(size: 40, weight: .light, design: .monospaced))
        .italic()
        .bold()
        .underline()
        .foregroundColor(.blue)
        .background(.red)
      Text("ary ary ary ary ary ary")
        .frame(width: 150)
        .lineLimit(3)
        .lineSpacing(125)
      
    }
  }
}

#Preview {
  TextExample()
}
