//
//  TitleText.swift
//  CursoiOS
//
//  Created by Leandro Favre on 19/11/2024.
//

import SwiftUI

struct TitleText: View {
  let text:String
  var body: some View {
    Text(text)
      .font(.title2)
      .foregroundColor(.gray)
  }
}
