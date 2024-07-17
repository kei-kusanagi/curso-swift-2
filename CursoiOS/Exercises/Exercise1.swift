//
//  ContentView.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 11/07/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }
            HStack{
                Rectangle().foregroundColor(.orange)
            }
            HStack{
                Circle().foregroundColor(.green)
                Rectangle()
                Circle().foregroundColor(.indigo)
            }.frame(height: 300)
            HStack{
                Rectangle().foregroundColor(.orange)
            }
            HStack{
                Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }
        }
        .background(.red)
        .padding()
        
    }
}

#Preview {
    Exercise1()
}
