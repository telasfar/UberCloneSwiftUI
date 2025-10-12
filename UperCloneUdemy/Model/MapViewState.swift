//
//  MapViewState.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 11/10/2025.
//

import Foundation
//la2en el mapview leha aktar men state zay maslan en el user 2e7'tar location fa et3red el polyline aw eno shal el mocation fa tshel el polyline we te3mel zoom 3ala el current location beta3o we hakza fa haye3mel enum shayel kol el sates deh

enum MapViewState {
    case noInput
    case searchingLocation
    case locationSelected
}
