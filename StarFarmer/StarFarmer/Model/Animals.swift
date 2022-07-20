//
//  animals.swift
//  StarFarmer
//
//  Created by Burak Altunoluk on 19/07/2022.
//

import Foundation
import UIKit
import AVFoundation


struct Animals {
    
    var typeOfAnimal: String
    var soundOfAnimal: String
    var pictureOfAnimal: String
    var waterDrink: Int
    
    init(animalName: String) {
       
        typeOfAnimal = animalName
        soundOfAnimal = animalName
        pictureOfAnimal = animalName
        waterDrink = 0
        
        switch animalName {
        case "cow" : waterDrink = 5
        case "sheep" : waterDrink = 3
        case "giraffe" : waterDrink = 10
        default: waterDrink = 0
        }
        
    }
    
    
    
    func playSound() {
        print("playSound")
      }
    
}
