//
//  ViewController.swift
//  Swapi
//
//  Created by mac on 2020/05/14.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit



enum SelectedSegment:Int {
    case starWarsPlanets = 0
    case starWarsSpaceships
    case starWarsVehicles
    case starWarspeople
    case starWarsFilms
    case starWarsSpecies
}

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
  

    fileprivate var peopleViewModel = PeopleViewModel()
    fileprivate var vehicleViewModel = VehicleViewModel()
    
    
    @IBOutlet weak var starWarsInformationTableView: UITableView!
    
    lazy var informationToDisplay = 0
    
    override func viewDidLoad() {
           super.viewDidLoad()
          
           starWarsInformationTableView.delegate = self
           starWarsInformationTableView.dataSource = self
        
              vehicleViewModel.getData(){
                    print("Vehicle Successful")
              }



            peopleViewModel.getData(){
                print("People Successful")
            }
        
      
      
           
       }

    
    @IBAction func searchSegment(_ sender: UISegmentedControl) {
       informationToDisplay = sender.selectedSegmentIndex
        starWarsInformationTableView.reloadData()
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 0
        
        if (informationToDisplay == SelectedSegment.starWarsPlanets.rawValue) {
            number = 10
                               
        } else if  (informationToDisplay == SelectedSegment.starWarsSpaceships.rawValue) {
            number = 5
                 
        } else if (informationToDisplay == SelectedSegment.starWarsVehicles.rawValue)  {
                number = vehicleViewModel.vehicleData.count
                       
        } else if  (informationToDisplay == SelectedSegment.starWarspeople.rawValue)  {
                number = peopleViewModel.peopleData.count
               
            
        } else if (informationToDisplay == SelectedSegment.starWarsFilms.rawValue)  {
            number = 10
            
        } else if (informationToDisplay == SelectedSegment.starWarsSpecies.rawValue)  {
             number = 10
        }
                          
       return number

    }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (informationToDisplay == SelectedSegment.starWarsPlanets.rawValue) {
            let  cell = tableView.dequeueReusableCell(withIdentifier: "CID_PlanetCell", for: indexPath) as! PlanetTableViewCell
            
            return cell
                        
              } else if  (informationToDisplay == SelectedSegment.starWarsSpaceships.rawValue) {
           let  cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpaceshipCell", for: indexPath) as! SpaceshipTableViewCell
            
            return cell
                   
              } else if (informationToDisplay == SelectedSegment.starWarsVehicles.rawValue)  {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CID_VehicleCell", for: indexPath) as! VehicleTableViewCell
            
            cell.vehicleNameLabel.text = "Name: " + vehicleViewModel.vehicleData[indexPath.row].name
            cell.vehicleManufucturerLabel.text = "Manufucturer: " + vehicleViewModel.vehicleData[indexPath.row].manufucturer!
            cell.vehicleModelLabel.text = "Model: " + vehicleViewModel.vehicleData[indexPath.row].model
            cell.vehicleCostLabel.text = "Cost: " + vehicleViewModel.vehicleData[indexPath.row].cost_in_credits!
            cell.vehicleNumberOfCrewLabel.text = "Number of crew: " + vehicleViewModel.vehicleData[indexPath.row].crew!
            
            
            
               return cell
                
              } else if  (informationToDisplay == SelectedSegment.starWarspeople.rawValue)  {
            let  cell = tableView.dequeueReusableCell(withIdentifier: "CID_PeopleCell", for: indexPath) as! PeopleTableViewCell
            
            
                cell.peopleNameLabel.text = "Name: " + peopleViewModel.peopleData[indexPath.row].name
                cell.peopleHeightLabel.text = "Height: " + peopleViewModel.peopleData[indexPath.row].height
                cell.peopleMassLabel.text = "Mass: "+peopleViewModel.peopleData[indexPath.row].mass
                         // cell.PeopleNameLabel.text = peopleViewModel.peopleData[indexPath.row].name
                return cell

                 
              } else if (informationToDisplay == SelectedSegment.starWarsFilms.rawValue)  {
                       let cell = tableView.dequeueReusableCell(withIdentifier: "CID_FilmCell", for: indexPath) as! FilmTableViewCell
            
            return cell
                  
              } else if (informationToDisplay == SelectedSegment.starWarsSpecies.rawValue)  {
                   let cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpecieCell", for: indexPath) as! SpaceshipTableViewCell
            return cell
                   
              }

         return UITableViewCell()
        
    }
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        var cellHeight = CGFloat()
              
        if informationToDisplay == SelectedSegment.starWarsPlanets.rawValue {
                cellHeight = 150
                  
        } else if informationToDisplay == SelectedSegment.starWarsSpaceships.rawValue  {
                  cellHeight = 150
             
        } else if informationToDisplay == SelectedSegment.starWarsVehicles.rawValue  {
                  cellHeight = 150
          
        } else if informationToDisplay == SelectedSegment.starWarspeople.rawValue  {
                cellHeight = 150
           
        } else if informationToDisplay == SelectedSegment.starWarsFilms.rawValue  {
                   cellHeight = 150
            
        } else if informationToDisplay == SelectedSegment.starWarsSpecies.rawValue  {
                  cellHeight = 150
             
        }
        return cellHeight
    }
  
}
