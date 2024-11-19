//
//  IMCView.swift
//  CursoiOS
//
//  Created by Leandro Favre on 18/11/2024.
//

import SwiftUI

struct IMCView: View {
  //  init(){
  //    UINavigationBar
  //      .appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
  //  }
  
  @State var gender = 0
  @State var height:Double = 150
  @State var age:Int = 18
  @State var weight:Int = 80
  
  var body: some View {
    NavigationStack {
      VStack{
        HStack{
          ToggleButton(
            text: "Hombre",
            imageName: "figure.stand",
            gender: 0,
            selectedGender: $gender
          )
          ToggleButton(
            text: "Mujer",
            imageName: "figure.stand.dress",
            gender: 1,
            selectedGender: $gender
          )
        }
        HeightCalculator(selectedHeight: $height)
        HStack{
          CounterButton(text: "Edad", number: $age)
          CounterButton(text: "Peso", number: $weight)
        }
        IMCCalculateButton(userWeight: Double(weight), userHeight: height)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.backgroundApp)
      .toolbar{
        ToolbarItem(placement: .principal, content: {
          Text("IMC Calculator")
            .bold()
            .foregroundColor(.white)
        })
      }
    }
    
  }
}

#Preview {
  IMCView()
}
