//
//  locations.swift
//  GASGO.
//
//  Created by Gehad Eid on 14/10/2023.
//

import MapKit

struct servcies {
    let icon : String
    let name : String
}

struct location: Identifiable { // Conform to Identifiable
    let id = UUID() // Add a unique identifier
    let name : String
    let image : String
    let coordinate : CLLocationCoordinate2D
    var rate : Double
    let closeAt : String
    var isOpened : Bool
    var service : [String]
    var isFav : Bool
    let photos : [String]
}

 class locationsModle : ObservableObject {
    @Published var locations : [location] = [
        location(name:"Aramco", 
                 image: "ARAMCO",
                 coordinate:CLLocationCoordinate2D(
                                latitude:  24.935459717113694,
                                longitude: 46.713218790018274),
                 rate: Double.random(in: 1.0..<5.0),
                 closeAt: "1AM",
                 isOpened: true,
                 service: ["toilet.fill", "basket", "creditcard.fill"],
                 isFav: false,
                 photos: ["String"]
                 
        ),
        location(name:"SASCO",
                 image:"SASCO"
                    ,coordinate:CLLocationCoordinate2D(
                                    latitude: 24.850835090907815,
                                    longitude: 46.73288616531626),
                 rate: Double.random(in: 1.0..<5.0),
                 closeAt: "1AM",
                 isOpened: true,
                 service: ["toilet.fill", "creditcard.fill", "person.fill.checkmark"],
                 isFav: false,
                 photos: ["String"]
        ),
        location(name:"NIFT",
                 image:"NIFT"
                    ,coordinate:CLLocationCoordinate2D(
            latitude: 24.810171757513416,
            longitude: 46.76044392397528),
                 rate: Double.random(in: 1.0..<5.0),
                 closeAt: "1AM",
                 isOpened: true,
                 service: ["toilet.fill", "basket", "moon.circle", "creditcard.fill"],
                 isFav: false,
                 photos: ["String"]
        ),
        location(name:"ALDREES",
                 image:"ALDREES"
                    ,coordinate:CLLocationCoordinate2D(
            latitude: 24.79349940124806,
            longitude: 46.70129795484269),
                 rate: Double.random(in: 1.0..<5.0),
                 closeAt: "1AM",
                 isOpened: true,
                 service: ["toilet.fill", "basket", "moon.circle", "creditcard.fill", "person.fill.checkmark"],
                 isFav: false,
                 photos: ["String"]
        )
    ] 
     
     func search(with query : String){
         
     }
}
