//
//  IMCView.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 16/07/24.
//

import SwiftUI

struct IMCView: View {
//    init(){
//        UINavigationBar.appearance()
//            .titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    @State var gender:Int = 0
    @State var userHeight:Double = 160
    @State var userWeight:Int = 80
    @State var age:Int = 18
    var body: some View {
        VStack{
            HStack{ToggleButton(text: "Hombre", imageName: "gamecontroller.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "heart.fill", gender: 1, selectedGender: $gender)
            }
            HeigtCalculator(selectedHeight: $userHeight)
            HStack{
                CounterButton(text: "Edad", number: $age)
                CounterButton(text: "Peso", number: $userWeight)
            }
            IMCCalculateButton(userWeight: Double(userWeight), userHeight: userHeight)
            
        }.frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity)
            .background(.backgroundApp)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("IMC Calculator")
                        .foregroundColor(.white)
                        .bold()
                }
            }
//            .navigationBarBackButtonHidden()
//            .navigationTitle("IMC Calculator")
    }
}

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination: {
                IMCResult(userWeight: userWeight, userHeight: userHeight)
            }){
                Text("Calcular IMC")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}


struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender:Int
    @Binding var selectedGender:Int
    
        
    var body: some View {
        let color = if( gender == selectedGender){
            Color.backgroundComponentSelected
        }else{
            Color.backgroundComponent
        }
        Button(action: {
            selectedGender = gender
        }) {
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(color)
        }

            
    }
}

struct InformationText:View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}


struct HeigtCalculator:View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in:100...220, step: 1).accentColor(.purple).padding(.horizontal, 16)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct CounterButton:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                Button(action: {
                    if (number > 0) {
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                            Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        
                    }
                }
                Button(action: {
                    if (number < 200) {
                        number += 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                            Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        
                    }
                }
            }
        }.frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

#Preview {
//    ToggleButton(text: "Kei", imageName: "heart.fill", index: 0)
    IMCView()
}


// 5:31:01
