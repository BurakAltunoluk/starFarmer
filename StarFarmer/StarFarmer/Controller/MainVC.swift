//
//  ViewController.swift
//  StarFarmer
//
//  Created by Burak Altunoluk on 19/07/2022.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {
    
    var totalWaterIntheTank = 500
    var totalAnimalsNeedWater = 0
    
    @IBOutlet var waterLitreLabel: UILabel!
    @IBOutlet var WaterProgressBar: UIProgressView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var farmPlaceView: UIView!
    @IBOutlet var totalNeedWater: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(waterTankProgress),
                             userInfo: nil,
                             repeats: true)
    
    }
    
    @IBAction func topUpWaterInTank(_ sender: UIButton) {
        totalWaterIntheTank += 50
    }
    
   
    @IBAction func buttonClicked(_ sender: UIButton) {
        let newAnimal = Animals(animalName: sender.restorationIdentifier!)
        animalCreate(animalName: newAnimal.typeOfAnimal)
        totalAnimalsNeedWater += newAnimal.waterDrink
        totalNeedWater.text = "All animals drink \(totalAnimalsNeedWater)L ph "
    }
    
    
    func animalCreate(animalName: String) {
        
        let animalImage = UIImage(named: "\(animalName)")
        let imageView = UIImageView(image: animalImage!)
        imageView.frame = CGRect(x: Int.random(in: 10...300), y: Int.random(in: 40...300), width: 50, height: 50)
        farmPlaceView.addSubview(imageView)
    }
    
    
    @objc func waterTankProgress() {
     
        waterLitreLabel.text = "\(totalWaterIntheTank - totalAnimalsNeedWater)L"
        totalWaterIntheTank -= totalAnimalsNeedWater
        WaterProgressBar.progress -= 0.02
    }
}


