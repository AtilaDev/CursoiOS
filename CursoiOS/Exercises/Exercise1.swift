//
//  ContentView.swift
//  CursoiOS
//
//  Created by Leandro Favre on 15/11/2024.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }
            .frame(height: 100)
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.orange)
            HStack {
                Circle()
                    .foregroundColor(.green)
                Rectangle()
                    .frame(height: 250)
                Circle()
                    .foregroundColor(.indigo)
            }
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.orange)
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }
            .frame(height: 100)
        }
        .background(.red)
    }
}

#Preview {
    Exercise1()
}

