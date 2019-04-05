//
//  DataService.swift
//  EarthquakeReport
//
//  Created by daicudu on 3/29/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class DataService {
    
    
    static var shared = DataService()

    let urlString = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
    
    func request(complerhandler: @escaping ([EarthQuakeInfo.Event]) -> ()) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let service = try JSONDecoder().decode(EarthQuakeInfoService.self, from: data)
                let earthQuakeInfo = EarthQuakeInfo(service: service)
                DispatchQueue.main.async {
                    complerhandler(earthQuakeInfo.events)
                }
            }catch {
                print(error)
            }
        }.resume()
        
    }
    
    
}




