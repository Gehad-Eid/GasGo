//
//  stationTapItem.swift
//  GASGO.
//
//  Created by Gehad Eid on 14/10/2023.
//

import SwiftUI

struct stationCard: View {
    var locationsArr : [location]
    var index : Int
    
    var body: some View {
        VStack{
            Button(action: {
                print("go ")
                
            }) {
                
                Image(locationsArr[index].image)
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .frame(width: 80, height: 80)
                    .offset(x: -2, y: 1)
                    .cornerRadius(30)
                    .padding(.all , 7)
                
                Text("   \(locationsArr[index].name)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x: -14, y: 0)
                
                Spacer()
                
                Text("\(Double.random(in: 1.0..<5.0), specifier: "%.2f") Km")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x: -14, y: 0)
                
            }
            .background(Color(red: 0.03529411764705882, green: 0.24313725490196078, blue: 0.3137254901960784))
            .cornerRadius(20)
            .padding([.leading, .trailing])
        }
    }
}

#Preview {
    stationCard(locationsArr: [], index: -1)
}
