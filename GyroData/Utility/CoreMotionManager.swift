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
    private var sensor = Sensor.accelerometer
    
    init() {
        motionManager.accelerometerUpdateInterval = 1/60
    }
    
    func startMeasure(of sensorType: Sensor) {
        guard motionManager.isAccelerometerAvailable || motionManager.isGyroAvailable else { return }
       
        switch sensorType {
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
            
            sensor = .accelerometer
        case .gyroscope:
            motionManager.startGyroUpdates(to: OperationQueue.main) { [weak self] gyroData, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                if let data = gyroData {
                    self?.xData.append(data.rotationRate.x)
                    self?.yData.append(data.rotationRate.y)
                    self?.zData.append(data.rotationRate.z)
                }
            }
            
            sensor = .gyroscope
        }
    }
    
    func stopMeasure() {
        motionManager.stopAccelerometerUpdates()
    }
}
