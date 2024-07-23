//
//  MapExample.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 22/07/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
    center: CLLocationCoordinate2D(
        latitude: 19.3855502,
        longitude: -99.0817052),
    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)))
    var body: some View {
        ZStack{
            MapReader{ proxy in
                
                Map(position: $position){
                    //                    Marker("Pollito frito", coordinate: CLLocationCoordinate2D(
                    //                        latitude: 19.3855502,
                    //                        longitude: -99.0817052))
                    //                }
                    Annotation("Pollito frito", coordinate: CLLocationCoordinate2D(
                        latitude: 19.3855502,
                        longitude: -99.0817052)){
                            Circle().frame(height: 30).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }.annotationTitles(.visible)
                }
                    .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                //                .onMapCameraChange { context in
                //                    print("Estamos en \(context.region)")
                //                }
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en \(context.region)")
                    }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local){
                            withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: coordinates.latitude,
                                    longitude: coordinates.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        )
                    }
                        }
                    }
            }
            VStack{
                Spacer()
                HStack{
                    Button("Ir al sur"){
                        withAnimation{
                        position = MapCameraPosition.region(MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: 19.3855502,
                                longitude: -99.0817052),
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    )
                }
    }.padding(32).background(.white).padding()
                    Button("Ir al norte")
                    {withAnimation{position = MapCameraPosition.region(MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: 19.3763052,
                                longitude: -99.1929585),
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
                        }
                    }.padding(32).background(.white).padding()
                }
            }
        }
            
    }
}

#Preview {
    MapExample()
}

// 07:18:50
