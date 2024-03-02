//
//  stationDetailsSheet.swift
//  GASGO.
//
//  Created by Gehad Eid on 14/10/2023.
//

import SwiftUI
import MapKit

struct stationDetailsSheet: View {
    @StateObject var selectedItem : locationsModle
     var selectedItemIndex : Int
    
    let iconTextMapping: [String: String] = [
            "toilet.fill": "Toilet",
            "basket": "Market",
            "moon.circle": "Mosque",
            "creditcard.fill": "Multi-payment",
            "person.fill.checkmark": "Self-service",
        ]
    
    var body: some View {
        ScrollView {
            Text(selectedItem.locations[selectedItemIndex].name)
                .foregroundColor(Color(red: 0.00392156862745098, green: 0.2823529411764706, blue: 0.44313725490196076))
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.title)
            
            VStack{
                
                HStack{
                    Text("\(selectedItem.locations[selectedItemIndex].rate, specifier: "%.2f")\t  ")
                        .offset(x:10 ,y:1)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(Color.yellow)
                    
                    Text("(\(Int.random(in: 1..<200))) ")
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.top,-20)
                
                
                
                VStack{
                    Text(selectedItem.locations[selectedItemIndex].isOpened ? "Open" : "Closed")
                        .offset(x:13 ,y:-33)
                        .foregroundColor(Color(hue: 0.409, saturation: 0.991, brightness: 0.443))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Text("\t\t Closeing at \(selectedItem.locations[selectedItemIndex].closeAt)")
                        .multilineTextAlignment(.leading)
                        .offset(x:-82 ,y:-58)
                        .foregroundColor(Color.black)
                }
                .padding(.top,25)
                
                
                
                HStack(alignment: .top){
                    
                    
                    Button("Start"){
                        //opens the location in Maps App
                        var selectedLocationMapItem = MKMapItem(placemark: MKPlacemark(coordinate: selectedItem.locations[selectedItemIndex].coordinate))
                        selectedLocationMapItem.name = selectedItem.locations[selectedItemIndex].name
                        selectedLocationMapItem.openInMaps()
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.00392156862745098, green: 0.2823529411764706, blue: 0.44313725490196076))
                    .offset(x:-91 ,y:-58)
                    
                    Button("Favoratie"){
                        // add to fav page
                        selectedItem.locations[selectedItemIndex].isFav = !selectedItem.locations[selectedItemIndex].isFav
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(selectedItem.locations[selectedItemIndex].isFav == true ? .yellow : Color(red: 0.00392156862745098, green: 0.2823529411764706, blue: 0.44313725490196076))
                    .offset(x:-91 ,y:-58)
                    //                    .offset(x:-39 ,y:-58)
                }
                
                //                LazyVGrid(columns: [
                //                    GridItem(.flexible(), spacing: 10),
                //                    GridItem(.flexible(), spacing: 10),
                //                    GridItem(.flexible(), spacing: 10),
                //                    GridItem(.flexible(), spacing: 10)
                //                ], spacing: 30) {
                //                    ForEach(selectedItem.locations[selectedItemIndex].service, id: \.self) { iconName in
                //                                    Image(systemName: iconName)
                //                                        .font(.system(size: 30))
                //                                        .frame(width: 60, height: 60)
                //                                        .background(Color(hex: 0x9ABCAB))
                //                                        .foregroundColor(.white)
                //                                        .cornerRadius(10)
                //                                }
                //                            }
                //                .padding(.top,-40)
                //                .padding(.leading,8)
                //                .padding(.trailing, 62)
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(selectedItem.locations[selectedItemIndex].service, id: \.self) { iconName in
                        VStack {
                            Image(systemName: iconName)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color(hex: 0x9ABCAB))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Text(iconTextMapping[iconName] ?? "Unknown")
                                .font(.caption)
                                .padding(.top, 4)
                        }
                    }
                }
                .padding(.top,-40)
                .padding(.leading,8)
                .padding(.trailing, 62)
            }
            .padding(.leading,20)
        }
        .padding(.top, 20)
        .padding(.leading, 10)
        }
    }

// Extension to create Color from a hex value
extension Color {
    init(hex: UInt) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double(hex & 0xff) / 255
        self.init(red: red, green: green, blue: blue)
    }
}

//#Preview {
//    stationDetailsSheet(selectedItem:)
//}
