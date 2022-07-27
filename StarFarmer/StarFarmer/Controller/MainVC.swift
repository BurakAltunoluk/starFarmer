//
//  ViewController.swift
//  StarFarmer
//
//  Created by Burak Altunoluk on 19/07/2022.
//

import UIKit
import AVFoundation
//import AVKit

final class MainVC: UIViewController {
    //MARK: Properties
    private var player: AVAudioPlayer!
    private var myFarmer = Myfarmer(name: "Green Farmer")
    private var time = 0
    private var totalAnimalsNeedWater = 0 //Litres
    
    @IBOutlet private var waterLitreLabel: UILabel!
    @IBOutlet private var WaterProgressBar: UIProgressView!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var farmPlaceView: UIView!
    @IBOutlet private var totalNeedWater: UILabel!
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(waterTankProgress),
                             userInfo: nil,
                             repeats: true)
    }
    
    @IBAction func topUpWaterInTank(_ sender: UIButton) {
        myFarmer.totalWaterIntheTank += 100
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        totalAnimalsNeedWater += myFarmer.addAnimal(typeOfAnimal: sender.restorationIdentifier!)
        animalCreate()
        totalNeedWater.text = "All animals drink \(totalAnimalsNeedWater)L ph "
    }
    
    func animalCreate() {
        let imageView = UIImageView(image: myFarmer.animals[0].pictureOfAnimal)
        imageView.frame = CGRect(x: Int.random(in: 10...300),
                                 y: Int.random(in: 40...300),
                                 width: 50,
                                 height: 50)
        farmPlaceView.addSubview(imageView)
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(play))
        imageView.addGestureRecognizer(gesture)
        animalRegister(sender: gesture)
    }
    
    @objc func waterTankProgress() {
        if time == 12 { time = 0 }
        time += 1
        timeLabel.text = String(time)
        waterLitreLabel.text = "\(myFarmer.totalWaterIntheTank - totalAnimalsNeedWater)L"
        myFarmer.totalWaterIntheTank -= totalAnimalsNeedWater
        
    }
    
    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func play(sender: UITapGestureRecognizer) {
        let IdSound = sender.view.hashValue
        playSound(name: myFarmer.animalsGestureSoundId[IdSound]!)
    }
    
    func animalRegister(sender: UITapGestureRecognizer) {
        let animalSound = myFarmer.animals[0].soundOfAnimal
        myFarmer.animalsGestureSoundId[sender.view.hashValue] = animalSound
        playSound(name: myFarmer.animals[0].soundOfAnimal)
    }
    
}


