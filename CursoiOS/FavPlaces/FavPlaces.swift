//
//  FavPlaces.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 23/07/24.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 19.3990063,
                longitude: -99.1171268),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5	)
        )
    )
    
    @State var places:[Place] = []
    @State var showPopUp:CLLocationCoordinate2D? = nil
    @State var showSheet:Bool = false
    @State var name:String = ""
    @State var fav:Bool = false
    
    let heigt = stride(from: 0.3, through: 0.3, by: 0.1).map{PresentationDetent.fraction($0)}
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map(position: $position){
                    ForEach(places){place in
                        Annotation(place.name, coordinate: place.coordinates){
                            let color = if place.fav { Color.yellow }else{ Color.black }
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                        
                    }
                }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local){
                            showPopUp = coordinates
                        }
                    }
                    .overlay{
                        VStack{
                            Button("Show list"){
                                showSheet = true
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(.white)
                            .cornerRadius(16)
                            .padding(16)
                            Spacer()
                        }
                    }
            }
            
            if showPopUp != nil{
                
                let view = VStack{
                    
                    Text("Añadir localizacion").font(.title2).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8)
                    Toggle("Es un lugar favorito?", isOn: $fav)
                    Spacer()
                    Button("Guardar"){
                        savePlace(name: name, fav: fav, coordinates: showPopUp!)
                        clearForm()
                    }
                }
                withAnimation{
                    CustomDialog(closeDialog: {
                        showPopUp = nil
                    }, onDismissOutside: true, content: view)
                }
            }
        }.sheet(isPresented: $showSheet){
            ZStack{
                Text("Soy una lista")
            }.presentationDetents(Set(heigt))
        }
      
    }
    
    func savePlace(name:String, fav:Bool, coordinates:CLLocationCoordinate2D){
        let palce = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(palce)
    }
    
    func clearForm(){
        name = ""
        fav = false
        showPopUp = nil
    }
}

#Preview {
    FavPlaces()
}
