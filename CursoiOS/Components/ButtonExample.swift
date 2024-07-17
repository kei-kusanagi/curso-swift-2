//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 15/07/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola"){
            print("Holaaaaaaa")
        }
        Button(action: {print("holiwi")}, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct Counter:View {
    @State var suscribersNumber = 0
    var body: some View {
        Button(action: {
            suscribersNumber += 1
        }, label: {
            Text("Suscriptores: \(suscribersNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
        })
    }
}

#Preview {
    Counter()
}
