//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 15/07/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("astranagant")
            .resizable()
            .frame(width: 400, height: 450)
            .scaledToFit()
        Image(systemName: "gamecontroller")
            .resizable()
            .frame(width: 50,height: 50)
    }
}

#Preview {
    ImageExample()
}
