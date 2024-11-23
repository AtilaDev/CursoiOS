//
//  CustomDialog.swift
//  CursoiOS
//
//  Created by Leandro Favre on 23/11/2024.
//

import SwiftUI

struct CustomDialog<Content:View>: View {
  let closeDialog:() -> Void
  let onDismissOutside:Bool
  let content:Content
  
  var body: some View {
    ZStack{
      Rectangle().fill(.gray.opacity(0.7))
        .ignoresSafeArea()
        .onTapGesture {
          if onDismissOutside{
            withAnimation{
              closeDialog()
            }
          }
        }
      
      content
        .frame(width: UIScreen.main.bounds.size.width-100, height: 200)
        .padding()
        .background(.white)
        .cornerRadius(16)
        .overlay(alignment: .topTrailing){
          Button(action: {
            withAnimation{
              closeDialog()
            }
          }, label: {
            Image(systemName: "xmark.circle")
              .resizable()
              .scaledToFit()
              .frame(height: 25)
          })
          .foregroundColor(.gray)
          .padding(16)
        }
    }
    .ignoresSafeArea()
    .frame(
      width: UIScreen.main.bounds.size.width,
      height: UIScreen.main.bounds.size.height,
      alignment: .center
    )
    
  }
}

#Preview {
  FavPlaces()
}
