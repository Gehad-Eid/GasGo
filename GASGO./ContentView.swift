//
//  ContentView.swift
//  GASGO.
//
//  Created by Abrar Alhazza on 25/03/1445 AH.
//

import SwiftUI

 

struct Tabs: View {
    @StateObject var locationModel = locationsModle()
    
    var body: some View {
        TabView {
            homePage(locationModel: locationModel)
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }.environmentObject(locationsModle())
            
            favorite(locationModel: locationModel)
                .tabItem {
                    Label("Favorite", systemImage: "star.fill")
                }.environmentObject(locationsModle())
            
            searchPage(locationModel: locationModel)
                .tabItem {
                    Label("Search", systemImage: "location.magnifyingglass")
                }.environmentObject(locationsModle())
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
