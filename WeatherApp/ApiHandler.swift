//
//  ApiHandler.swift
//  WeatherApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 vishal. All rights reserved.
//

import Foundation

class ApiHandler{
    
    static let shared = ApiHandler()

    func searchcity(with name:String) -> [CityDetail]{
        
        if let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=9ed7cfcb9dac424e929134511210707&q=\(name)")
        {
            
            if let data = try? Data(contentsOf: url)
            {
                
                let decoder = JSONDecoder()
                    
                if let JSONData = try? decoder.decode(CityDetail.self,from: data)
                {
                    print(JSONData.current.condition)
                    return [JSONData]
                }
            }
        }
        return [CityDetail]()
    }
}
