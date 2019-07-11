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
    @IBOutlet weak var valueZLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
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
                
//                if (((data!.magneticField.x > 25)&&(data!.magneticField.x < 30))&&((data!.magneticField.y > 22)&&(data!.magneticField.y < 27))){
//                    self.directionLabel.text = "heading to NORTH"
//                } else if (((data!.magneticField.x > -17)&&(data!.magneticField.x < -12))&&((data!.magneticField.y > 0)&&(data!.magneticField.y < 5 ))){
//                    self.directionLabel.text = "heading to EAST"
//                } else if (((data!.magneticField.x > 5)&&(data!.magneticField.x < 10))&&((data!.magneticField.y > -45)&&(data!.magneticField.y < -40))){
//                    self.directionLabel.text = "heading to SOUTH"
//                } else if (((data!.magneticField.x > 50)&&(data!.magneticField.x < 55))&&((data!.magneticField.y > 0)&&(data!.magneticField.y < 5))){
//                    self.directionLabel.text = "heading to WEST"
//                } else{
//                    self.directionLabel.text = "Where am I ?"
//                }
                
                
                //In the magnetometer code, you would use a distance heuristic to sense a large change in the magnetic field.
                
                let totalMagneticField = abs(data!.magneticField.x)+abs(data!.magneticField.y)+abs(data!.magneticField.z)
                

                if (totalMagneticField > 1000){
                    
                    let y  = CGFloat(data!.magneticField.y)/2000
                    self.colorView.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: y)
                    self.valueYLabel.text = "I SENSE SOMETHING"
                } else{
                    self.valueYLabel.text = "ALL CLEAR"
                    self.colorView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha:1)
                }
                
                self.valueXLabel.text = String(format: "%.2f",((data?.magneticField.x)!))


            }
        }
    }
    
    func stopMagnetometer() {
        motionManager.stopMagnetometerUpdates()
    }


}


