//
//  MeasuredData.swift
//  GyroData
//
//  Created by Hyejeong Jeong on 2023/06/13.
//

import Foundation

struct MeasuredData: Hashable {
    let id: UUID
    let date: Date
    let sensor: Sensor
    let time: Double
    let sensorData: SensorData
}

enum Sensor {
    case accelerometer
    case gyroscope
    
    var title: String {
        switch self {
        case .accelerometer:
            return "Accelerometer"
        case .gyroscope:
            return "Gyro"
        }
    }
}

struct SensorData: Codable, Hashable {
    let x: [Double]
    let y: [Double]
    let z: [Double]
}
