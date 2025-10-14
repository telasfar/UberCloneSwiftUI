//
//  LoactionSearchVM.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import Foundation
import MapKit

class LoactionSearchVM:NSObject,ObservableObject,Observable{
    
    @Published var locations = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate:CLLocationCoordinate2D?//hayet3amlo set men el tapGesture beta3
    var userLocation:CLLocationCoordinate2D?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryString = ""{
        didSet{
            searchCompleter.queryFragment = queryString
        }
    }
    
    override init() {//el override deh gaya men NSObject
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryString//el search completer bey7tag el queryFragment 3ashan ye3mel search fe el locations
        
    }
    
    func selectLocation(location:MKLocalSearchCompletion){
        localSearchCoordinate(for: location) { [weak self] response, err in
            guard let searchItem = response?.mapItems.first else { return }
            let coordinate = searchItem.placemark.coordinate
            self?.selectedLocationCoordinate = coordinate
        }
    }
    
  
    func localSearchCoordinate(for localSearch: MKLocalSearchCompletion, complition: @escaping (MKLocalSearch.CompletionHandler)) {
        //2a3taked 7at complition fe el signature 3ashan yestfad ebl (MKLocalSearch.CompletionHandler) elmawgod aslan
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: complition)
        
    }
    
    //TODO: move this function to a new viewMOdel for RideRequestView
    func computRidePrice(type:RideType) -> Double{
        guard let selectedLocationCoordinate = selectedLocationCoordinate , let userLocation = userLocation else { return 0 }
        let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let destantionCLLocation = CLLocation(latitude: selectedLocationCoordinate.latitude, longitude: selectedLocationCoordinate.longitude)
        let tripDistanceInKiloMeter = userCLLocation.distance(from: destantionCLLocation) / 1000
        return type.computDistanceFare(distance: tripDistanceInKiloMeter)
        
    }
}

extension LoactionSearchVM:  MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.locations = completer.results
    }
}
