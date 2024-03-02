//
//  favorite.swift
//  GASGO.
//
//  Created by Gehad Eid on 11/10/2023.
//

import SwiftUI

struct favorite: View {
    
    @StateObject var locationModel : locationsModle
    @State private var anythingInFav : Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            // the page title
            Text("Favorite")
                .font(.title)
                .bold()
                .padding(20)
            
            // fav items
            ScrollView{
                VStack{
                    if(anythingInFav > 0){
                        ForEach(0..<locationModel.locations.count, id: \.self){ i in
                            if(locationModel.locations[i].isFav == true){
                                stationCard(locationsArr: locationModel.locations, index: i)
                            }
                        }
                        
                    }else{
                        ContentUnavailableView("You Didn't Add Any Station To Favorite", systemImage: "eye.slash.fill")
                    }
                }
                .task {
                    var counter: Int = locationModel.locations.count-1
                    
                    while (counter >= 0){
                        if(locationModel.locations[counter].isFav == true){
                            anythingInFav+=1
                        }
                        counter-=1
                    }
                }
            }
        }
    }
}

//#Preview {
//    favorite(locationModel: <#locationsModle#>)
//}
