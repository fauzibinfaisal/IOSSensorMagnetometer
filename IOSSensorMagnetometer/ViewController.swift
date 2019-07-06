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
                
                self.valueXLabel.text = String(format: "%.2f",((data?.magneticField.x)!))
                self.valueYLabel.text = String(format: "%.2f",((data?.magneticField.y)!))
                self.valueZLabel.text = String(format: "%.2f",((data?.magneticField.z)!))
            }
        }
    }
    
    func stopMagnetometer() {
        motionManager.stopMagnetometerUpdates()
    }


}


