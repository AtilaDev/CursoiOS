//
//  InformationText.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct InformationText: View {
  let text:String
  
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .bold()
      .foregroundColor(.white)
  }
}
