//
//  PlanetViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SearchStarWarsViewModel {
    
    var planetData : [PlanetData] = []
    var spaceshipData : [SpaceshipData] = []
    var vehicleData : [VehicleData] = []
    var peopleData : [PeopleData] = []
    var filmData : [FilmData] = []
    var specieData : [SpecieData] = []
    
               
 func getData(searchType:String,completed: @escaping () ->())  {
        
    let baseUrl = "https://swapi.dev/api/"
    let urlString = baseUrl + searchType
    let url = URL(string: urlString)
    let sessionCongfig = URLSession.shared
    let _: Void = sessionCongfig.dataTask(with: url!) { (data, response, error) in
    if let data = data {
        print(data)
        //print(response) // Response even return the URL that was called
      do {
        // JSON Parsing
         let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
         let userDataArr = jsonData?["results"] as!  [[String: Any]]
            //  print(userDataArr)
        
         for jsonDetailData in userDataArr {
            DispatchQueue.main.async {
                completed()
                
        if (searchType == "planets"){
                                            
            print(jsonDetailData.count)
            let planetName = jsonDetailData["name"] as! String
            let rotation_period = jsonDetailData["rotation_period"] as! String
            let diameter = jsonDetailData["diameter"] as! String
            let climate = jsonDetailData["climate"] as! String
            let population = jsonDetailData["population"] as! String
            let tempData = PlanetData(name: planetName, rotation_Period: rotation_period, diameter: diameter, climate: climate, population: population)
                self.planetData.append(tempData)
                print("Planet tempdata",tempData)
                
        }else if (searchType == "starships"){
            
            print(jsonDetailData.count)
            let name = jsonDetailData["name"] as! String
                                    
            let manufucturer = jsonDetailData["manufacturer"] as! String
            let crew = jsonDetailData["crew"] as! String
            let passengers = jsonDetailData["passengers"] as! String
            let cargo_capacity = jsonDetailData["cargo_capacity"] as! String
            let tempData = SpaceshipData(name: name, manufucturer: manufucturer,crew: crew, passengers: passengers, cargo_capacity: cargo_capacity)
                self.spaceshipData.append(tempData)
                print("Spaceship tempdata",tempData)
                
        }else if (searchType == "vehicles"){
            
            print(jsonDetailData.count)
            let name = jsonDetailData["name"] as! String
            let model = jsonDetailData["model"] as! String
            let manufucturer = jsonDetailData["manufacturer"] as! String
            let cost = jsonDetailData["cost_in_credits"] as! String
            let crew = jsonDetailData["crew"] as! String
            let tempData = VehicleData(name: name, model: model, manufucturer:manufucturer,cost_in_credits: cost,crew: crew)
                self.vehicleData.append(tempData)
                print("Vehicle tempdata",tempData)
                
        }else if (searchType == "people"){
            
            print(jsonDetailData.count)
            let name = jsonDetailData["name"] as! String
            let height = jsonDetailData["height"] as! String
            let  mass = jsonDetailData["mass"] as! String
            let  gender = jsonDetailData["gender"] as! String
            let  birthYear = jsonDetailData["birth_year"] as! String
            let tempData = PeopleData(name: name, height: height, mass: mass,gender:gender,birthYear: birthYear )
                self.peopleData.append(tempData)
                print("tempdata",tempData)
                
                
        }else if (searchType == "films"){
            
            print(jsonDetailData.count)
            let filmTiltle = jsonDetailData["title"] as! String
            let filmEpisodeId = jsonDetailData["episode_id"] as! Int
            let filmDirector = jsonDetailData["director"] as! String
            let filmProducer = jsonDetailData["producer"] as! String
            let tempData = FilmData(title: filmTiltle, episode_id:filmEpisodeId, director: filmDirector, producer: filmProducer)
                self.filmData.append(tempData)
                print("Film tempdata",tempData)
                
        }else if (searchType == "species"){
            print(jsonDetailData.count)
            let specieName = jsonDetailData["name"] as! String
            let classification  = jsonDetailData["classification"] as! String
            let designation  = jsonDetailData["designation"] as! String
            let average_height  = jsonDetailData["average_height"] as! String
            let language  = jsonDetailData["language"] as! String
            let tempData = SpecieData(name: specieName, classification: classification, designation: designation, average_height: average_height, language: language)
                self.specieData.append(tempData)
                print("Planet tempdata",tempData)
            }
                
          }

       }

       }catch {
        print(error)
       }
     }
   }.resume()
  }
}
