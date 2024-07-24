//
//  Place.swift
//  CursoiOS
//
//  Created by Juan Carlos Robledo Morales on 23/07/24.
//

import Foundation
import MapKit

struct Place:Identifiable{
    let id = UUID()
    var name:String
    var coordinates:CLLocationCoordinate2D
    var fav:Bool
    
}
