//
//  TextExample.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 15/07/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hello, World!").font(.headline)
            Text("Custom").font(.system(
                size: 40, weight: .light, design: .monospaced
            )).italic().bold().underline().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).background(.red)
            Text("kei kei kei kei kei kei kei kei kei kei").frame(width: 150).lineLimit(3)
                .lineSpacing(125)
        }
    }
}

#Preview {
    TextExample()
}
