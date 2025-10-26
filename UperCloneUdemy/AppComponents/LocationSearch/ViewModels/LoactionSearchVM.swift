//
//  LoactionSearchVM.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import Foundation
import MapKit
import Firebase
import FirebaseAuth

enum LocationSearchConfig{
    case bookRide
    case saveLocation(SavedLocationModel)//7at el enum as associated value hena
}

class LoactionSearchVM:NSObject,ObservableObject,Observable{
    
    @Published var locations = [MKLocalSearchCompletion]()
   // @Published var selectedLocationCoordinate:CLLocationCoordinate2D?//hayet3amlo set men el tapGesture beta3
    
    @Published var selectedUberLocation:UberLocation?//will use this instade of selectedLocationCoordinate
    @Published var pickUpTime:String?//will calculate this times from the route in getDestinationRoute
    @Published var dropOffTime:String?
    
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
    
    func selectLocation(location:MKLocalSearchCompletion, config:LocationSearchConfig){
        localSearchCoordinate(for: location) { [weak self] response, err in
            guard let searchItem = response?.mapItems.first else { return }
            let coordinate = searchItem.placemark.coordinate
            switch config{
            case .bookRide:
                self?.selectedUberLocation = UberLocation(title: location.title, coordinate: coordinate)
            case .saveLocation(let savedLocationConfig)://haygeb el asociated value men hena
                print("save location to core data")
                guard let userID = Auth.auth().currentUser?.uid else { return }
                let savedLocation = locationModel(title: location.title, address: location.subtitle, coordinate: GeoPoint(latitude: coordinate.latitude, longitude: coordinate.longitude))
                if let encodedLocation = try? Firestore.Encoder().encode(savedLocation){//3amal encode lel location el 2awel
                    Firestore.firestore().collection("user").document(userID).updateData([savedLocationConfig.databaseIdentifier:encodedLocation])
                }
                
            }
        }
//        switch config{
//        case .bookRide:
//            localSearchCoordinate(for: location) { [weak self] response, err in
//                guard let searchItem = response?.mapItems.first else { return }
//                let coordinate = searchItem.placemark.coordinate
//                //self?.selectedLocationCoordinate = coordinate
//                self?.selectedUberLocation = UberLocation(title: location.title, coordinate: coordinate)
//            }
//        case .saveLocation:
//            print("save location to core data")
//        }//shof hwa 3amal refactor hena ezay eno 7at el switch gowa el clousre mosh el 3aks
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
        guard let selectedLocationCoordinate = selectedUberLocation?.coordinate , let userLocation = userLocation else { return 0 }
        let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let destantionCLLocation = CLLocation(latitude: selectedLocationCoordinate.latitude, longitude: selectedLocationCoordinate.longitude)
        let tripDistanceInKiloMeter = userCLLocation.distance(from: destantionCLLocation) / 1000
        return type.computDistanceFare(distance: tripDistanceInKiloMeter)
        
    }
    
    func getDestinationRoute(
        from userLocation:CLLocationCoordinate2D,
        to destinationLocation:CLLocationCoordinate2D,
        complition: @escaping (MKRoute) -> Void){
            let userPlaceMark = MKPlacemark(coordinate: userLocation)
            let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlaceMark)
            request.destination = MKMapItem(placemark: destinationPlaceMark)
            request.transportType = .automobile
            let directions = MKDirections(request: request)
            directions.calculate() { (response, error) in
                guard let route = response?.routes.first else { return }
                self.configureTimeForPickeupandDropOff(expectedTime: route.expectedTravelTime)//gab men el route el expectedTime
                complition(route)
            }
     }
    
    func configureTimeForPickeupandDropOff(expectedTime:Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        pickUpTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTime)
    }
}

extension LoactionSearchVM:  MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.locations = completer.results
    }
}
