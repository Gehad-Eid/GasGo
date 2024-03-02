//
//  Container.swift
//  GasGo
//
//  Created by Gehad Eid on 14/02/2024.
//

import SwiftUI

struct Container: View {
    var body: some View {
        TabView {
            Stations()
                .tabItem {
                    Image(systemName: "fuelpump.fill")
                    Text("Stations")
                }
            
            Favorite()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
            
            Profile()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    Container()
}
