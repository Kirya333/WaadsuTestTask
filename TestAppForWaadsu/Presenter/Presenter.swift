//
//  Presenter.swift
//  TestAppForWaadsu
//
//  Created by Кирилл Тарасов on 02.11.2021.
//

import Foundation
import MapKit

protocol ViewProtocol: AnyObject {
    func success(overlays: [MKOverlay], widthRoute: String)
    func failure(error: Error)
}

protocol PresenterProtocol {
    func getOverlaysAndCoordinates()
}

// cтруктуры для скорости работы 
struct Presenter: PresenterProtocol {
    
    weak var view: ViewProtocol?
    let waadsuAPI: NetworkServiceProtocol
    
    init(view: ViewProtocol, waadsuAPI: NetworkServiceProtocol) {
        self.view = view
        self.waadsuAPI = waadsuAPI
    }
    
    func getOverlaysAndCoordinates() {
        waadsuAPI.getOverlays { result in
            switch result {
            case .success(let (overlays, coordinates)):
                let widthRoute = routeDistanceCalculation(locationCoordinates: coordinates)
                view?.success(overlays: overlays, widthRoute: widthRoute)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    private func routeDistanceCalculation(locationCoordinates: [CLLocationCoordinate2D]) -> String {
        var allDistance: Double = 0
        for index in 0...locationCoordinates.count - 2 {
            
            let startLocation = MKMapPoint(locationCoordinates[index])
            let destenationLocation = MKMapPoint(locationCoordinates[index + 1])
            
            let distance = startLocation.distance(to: destenationLocation)
            allDistance += distance
        }
        
        return "\(allDistance)"
    }
}
