//
//  WeatherManager.swift
//  Clima
//
//  Created by Matheus Sales on 19/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {

    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=893f45834bef233ac977367f4a470669&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let data {
            let dataString = String(data: data, encoding: .utf8)
            print(dataString!)
            return
        }
    }
}
