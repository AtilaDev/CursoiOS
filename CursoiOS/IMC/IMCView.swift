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

struct IMCCalculateButton: View {
  let userWeight:Double
  let userHeight:Double
  
  var body: some View {
    NavigationStack{
      NavigationLink(destination: IMCResult(userWeight: userWeight, userHeight: userHeight), label: {
        Text("Calcular")
          .font(.title)
          .bold()
          .foregroundColor(.purple)
          .frame(maxWidth: .infinity, maxHeight: 100)
          .background(.backgroundComponent)          
      })
      
    }
  }
}

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

struct InformationText: View {
  let text:String
  
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .bold()
      .foregroundColor(.white)
  }
}

struct TitleText: View {
  let text:String
  var body: some View {
    Text(text)
      .font(.title2)
      .foregroundColor(.gray)
  }
}

struct HeightCalculator: View {
  @Binding var selectedHeight:Double
  
  var body: some View {
    VStack{
      TitleText(text: "Altura")
      InformationText(text: "\(Int(selectedHeight)) cm")
      Slider(value: $selectedHeight, in:100...220, step: 1)
        .accentColor(.purple)
        .padding(.horizontal, 16)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.backgroundComponent)
    .cornerRadius(16)
  }
}

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



#Preview {
  IMCView()
}
