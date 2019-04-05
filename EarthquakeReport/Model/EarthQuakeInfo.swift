//
//  EarthQuakeInfo.swift
//  EarthquakeReport
//
//  Created by daicudu on 3/28/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

struct EarthQuakeInfo: Decodable {
    var events: [Event]
    struct Event: Decodable {
        var dateString: String?
        var timeString: String?
        var distanceString: String?
        var locationName: String?
        var mag: Double?
        var url: String?
    }
    
    init(service: EarthQuakeInfoService) {
        
        self.events = service.features.map({ (feature) -> Event in
            let dateString = feature.properties.time.toMediumDate()
            let timeString = feature.properties.time.toShortTime()
            let mag = feature.properties.mag
            let url = feature.properties.url
            var locationName = feature.properties.place
            
            let placeStrings = feature.properties.place.components(separatedBy: " of ")
            var distanceString = ""
            if placeStrings.count > 1 {
                distanceString = placeStrings.first!
                if let index = (locationName.range(of: " of ")?.upperBound) {
                    locationName = String(locationName.suffix(from: index)) //prints "value"
                }
                
            }
            
            return Event(dateString: dateString, timeString: timeString, distanceString: distanceString, locationName: locationName, mag: mag, url: url)
        })
    }
}

struct EarthQuakeInfoService: Decodable {
    var features: [Feature]
    
    struct Feature: Decodable {
        var properties: Property
        
        struct Property: Decodable {
            var time: TimeInterval
            var place: String
            var mag: Double
            var url: String
            
            private enum CodingKeys: String, CodingKey {
                case time
                case place
                case mag
                case url
            }
        }
    }
}


// MARK: - TimeInterval

extension TimeInterval {
    func toShortTime() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .none
        dateFormater.timeStyle = .short
        return dateFormater.string(from: Date(timeIntervalSince1970: self / 1000))
    }
    
    func toMediumDate() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        return dateFormater.string(from: Date(timeIntervalSince1970: self / 1000))
    }
}
