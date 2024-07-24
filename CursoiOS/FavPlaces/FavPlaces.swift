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
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    )
    
    @State var places: [Place] = []
    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var showSheet: Bool = false
    @State var name: String = ""
    @State var fav: Bool = false
    
    let heigt = stride(from: 0.3, through: 0.3, by: 0.1).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            let color = place.fav ? Color.yellow : Color.black
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        showPopUp = coordinates
                    }
                }
                .overlay {
                    VStack {
                        Button("Show list") {
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
            
            if showPopUp != nil {
                let view = VStack {
                    Text("Añadir localizacion").font(.title2).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8)
                    Toggle("Es un lugar favorito?", isOn: $fav)
                    Spacer()
                    Button("Guardar") {
                        savePlace(name: name, fav: fav, coordinates: showPopUp!)
                        clearForm()
                    }
                }
                withAnimation {
                    CustomDialog(closeDialog: {
                        showPopUp = nil
                    }, onDismissOutside: true, content: view)
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(places) { place in
                        let color = place.fav ? Color.yellow.opacity(0.5) : Color.black.opacity(0.5)
                        VStack {
                            Text(place.name).font(.title3).bold()
                        }
                        .frame(width: 150, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(color, lineWidth: 1)
                        }
                        .shadow(radius: 5)
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            animateCamera(cordinates: place.coordinates)
                            showSheet = false
                        }
                    }
                }
            }
            .presentationDetents(Set(heigt))
        }
    }
    
    func animateCamera(cordinates: CLLocationCoordinate2D) {
        withAnimation {
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: cordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
            )
        }
    }
    
    func savePlace(name: String, fav: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
    }
    
    func clearForm() {
        name = ""
        fav = false
        showPopUp = nil
    }
}


#Preview {
    FavPlaces()
}
