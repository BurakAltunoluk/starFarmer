//
//  MyFarmer.swift
//  StarFarmer
//
//  Created by Burak Altunoluk on 25/07/2022.
//

import Foundation
struct Myfarmer {
    
    var name: String
    var animals = [Animals]()
    var animalsGestureSoundId = [Int:String]()
    var totalWaterIntheTank = 500
    
    init(name: String) {
        self.name = name
    }
    mutating func addAnimal(typeOfAnimal: String) -> Int{
        let nemAnimal = Animals(animalName: typeOfAnimal)
        animals.insert(nemAnimal, at: 0)
        return animals[0].waterDrink
        
    }
}
