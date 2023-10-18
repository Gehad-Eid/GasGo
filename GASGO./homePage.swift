//
//  homePage.swift
//  GASGO.
//
//  Created by Gehad Eid on 11/10/2023.
//

import SwiftUI
import MapKit

struct homePage: View {
    
    @StateObject private var model = mapModel()
    @StateObject var locationModel : locationsModle
    @State private var selectedItem: Int?
    @State private var showDetails = false
    @State private var route : MKRoute?
    @State private var routeDisplaying = false
    @State private var DestationRoute : location? //check => MKMapItem

    
    var body: some View {
        VStack(alignment: .leading){
            // the page title
            Text("Map")
                .font(.title)
                .bold()
                .padding(20)
            
            Map(position: $model.cameraPosition,interactionModes: .all, selection: $selectedItem
                /*bounds: nil,*/ /*, scope: nil*/
                /*coordinateRegion: $model.cameraPosition, showsUserLocation: true*/){
                UserAnnotation()
                
                
                //place markers for all the stations on the map
                ForEach(0..<locationModel.locations.count, id: \.self){ i in
                    Marker(locationModel.locations[i].name,coordinate: locationModel.locations[i].coordinate)
                        .tag(i)
                }
            }
            // when selecting a station marker a sheet will appear
                .onChange(of: selectedItem, { oldValue, newValue in
                     showDetails = newValue != nil
                })
                .accentColor(Color(.systemBlue))
            
            //check if the location feature is enabled or not
                .onAppear{
                    model.isLocationEnabled()
                }
            
            //to show the location and 3D feature
                .mapControls{
                    MapUserLocationButton()
                    MapPitchToggle()
                }
            
            //show a draggable sheet that containes the station info
                .sheet(isPresented: $showDetails, content: {
                    stationDetailsSheet(selectedItem: locationModel, selectedItemIndex: selectedItem ?? 0)
                        .presentationDetents([.height(400)])
                        .presentationBackgroundInteraction(.enabled(upThrough: .height(400)))
                        .presentationCornerRadius(20)
                })
            
            // the map top radius set to 20
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
            
            //near by stations
            ScrollView{
                VStack{
                    ForEach(0..<locationModel.locations.count, id: \.self){ i in
                        stationCard(locationsArr: locationModel.locations, index: i)
                        // go to locatio ..... check 
                            .onTapGesture {
                                model.cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: locationModel.locations[i].coordinate, span: mapDetailes.defaultSpan))
                            }
                    }
                }
            }
        }
    }
}

//#Preview {
//    homePage()
//}



