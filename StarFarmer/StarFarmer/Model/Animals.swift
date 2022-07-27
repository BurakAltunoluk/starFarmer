//
//  animals.swift
//  StarFarmer
//
//  Created by Burak Altunoluk on 19/07/2022.
//

import Foundation
import UIKit

struct Animals {
    
    var typeOfAnimal: String
    var soundOfAnimal: String
    var pictureOfAnimal: UIImage
    var waterDrink: Int
   
    init(animalName: String) {
        
        typeOfAnimal = animalName
        soundOfAnimal = animalName
        pictureOfAnimal = UIImage(named: animalName)!
        waterDrink = 0
        
        switch animalName {
        case "cow" : waterDrink = 5
        case "sheep" : waterDrink = 3
        case "giraffe" : waterDrink = 10
        default: waterDrink = 0
        }
    }
    
  
    
}

