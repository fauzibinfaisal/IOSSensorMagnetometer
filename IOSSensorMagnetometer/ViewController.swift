//
//  ViewController.swift
//  IOSSensorMagnetometer
//
//  Created by Fauzi Fauzi on 05/07/19.
//  Copyright © 2019 Fauzi. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var valueXLabel: UILabel!
    @IBOutlet weak var valueYLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    
    //TODO 1: Initialize CMMotionManager
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        startMagnetometer()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        stopMagnetometer()
    }
    
    func startMagnetometer() {
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            
            //Double click pada handlernya
            motionManager.startMagnetometerUpdates(to: OperationQueue.main) { (data, error) in
                print("magnetometerData \(String(describing: data))")
                
//                let dataXY = (data!.magneticField.x,data!.magneticField.y)
                
//                switch dataXY {
//                case (10..<20, 48..<53):
//                    self.directionLabel.text = "heading to NORTH"
//                case ((-22)..<(-16), 10..<20):
//                    self.directionLabel.text = "heading to EAST"
//                case (11..<21, (-22)..<(-17)):
//                    self.directionLabel.text = "heading to SOUTH"
//                case (45..<50, 11..<21):
//                    self.directionLabel.text = "heading to WEST"
//
//                default:
//                    self.directionLabel.text = "Where am I ?"
//
//                }
                
                if (((data!.magneticField.x > 4)&&(data!.magneticField.x < 9))&&((data!.magneticField.y > 29)&&(data!.magneticField.y < 34))){
                    self.directionLabel.text = "heading to NORTH"
                } else if (((data!.magneticField.x > -30)&&(data!.magneticField.x < -25))&&((data!.magneticField.y > -8)&&(data!.magneticField.y < -3))){
                    self.directionLabel.text = "heading to EAST"
                } else if (((data!.magneticField.x > 5)&&(data!.magneticField.x < 10))&&((data!.magneticField.y > -45)&&(data!.magneticField.y < -40))){
                    self.directionLabel.text = "heading to SOUTH"
                } else if (((data!.magneticField.x > 45)&&(data!.magneticField.x < 50))&&((data!.magneticField.y > -10)&&(data!.magneticField.y < 1))){
                    self.directionLabel.text = "heading to WEST"
                } else{
                    self.directionLabel.text = "Where am I ?"
                }
                
                
                self.valueXLabel.text = String(format: "%.2f",((data?.magneticField.x)!))
                self.valueYLabel.text = String(format: "%.2f",((data?.magneticField.y)!))
            }
        }
    }
    
    func stopMagnetometer() {
        motionManager.stopMagnetometerUpdates()
    }


}


