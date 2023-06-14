//
//  CoreMotionManager.swift
//  GyroData
//
//  Created by Hyejeong Jeong on 2023/06/14.
//

import Foundation
import CoreMotion

final class CoreMotionManager {
    private let motionManager = CMMotionManager()
    private var xData: [Double] = []
    private var yData: [Double] = []
    private var zData: [Double] = []
    
    init() {
        motionManager.accelerometerUpdateInterval = 1/60
    }
    
    func startMeasure(of sensor: Sensor) {
        guard motionManager.isAccelerometerAvailable || motionManager.isGyroAvailable else { return }
       
        switch sensor {
        case .accelerometer:
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { [weak self] (accelerometerData, error) in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                if let data = accelerometerData {
                    self?.xData.append(data.acceleration.x)
                    self?.yData.append(data.acceleration.y)
                    self?.zData.append(data.acceleration.z)
                }
            }
        case .gyroscope:
            break
        }
    }
    
    func stopMeasure() {
        motionManager.stopAccelerometerUpdates()
    }
}
