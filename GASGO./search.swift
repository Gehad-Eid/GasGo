//
//  search.swift
//  GasGo
//
//  Created by Gehad Eid on 11/10/2023.
//

import SwiftUI

struct searchPage: View {
    
    @StateObject var locationModel : locationsModle
    @State private var searchText = ""
    
    var filteredLocations : [location]{
        guard !searchText.isEmpty else {
            return locationModel.locations
        }
        return locationModel.locations.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
    }
    
    
    var body: some View {
    
        // search par
        NavigationStack{
            List(filteredLocations, id:\.id) { location in
                HStack(spacing: 20){
                    Image(location.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.circle)
                        .frame(width: 44, height: 44)
                    //                            .cornerRadius(30)
                    
                    Text(location.name)
                        .font(.title3)
                        .fontWeight(.medium)
                    
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search for a gas station")
        }
    }
}


//#Preview {
//    searchPage()
//}
