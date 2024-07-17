//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 15/07/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        // Label("Suscribete", image: "astranagant").frame(width: 20, height: 30)
Label("Suscribete", systemImage: "figure.badminton")
        Label(
            title: { Text("SUSCRIBETE") },
            icon: { Image("astranagant").resizable().frame(width: 40,height: 40).scaledToFill() }
        )
    }
}

#Preview {
    LabelExample()
}
