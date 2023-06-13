//
//  ViewController.swift
//  GyroData
//
//  Created by kjs on 2022/09/16.
//

import UIKit

final class ListViewController: UIViewController {
    enum Section {
        case main
    }
    
    private var measuredDataList: [MeasuredData] = [
        MeasuredData(id: UUID(), date: Date(), sensor: .accelerometer, time: 30.5, sensorData: SensorData(x: [1], y: [2], z: [3])),
        MeasuredData(id: UUID(), date: Date(), sensor: .gyroscope, time: 60.0, sensorData: SensorData(x: [1], y: [2], z: [3])),
        MeasuredData(id: UUID(), date: Date(), sensor: .accelerometer, time: 30.4, sensorData: SensorData(x: [1], y: [2], z: [3])),
        MeasuredData(id: UUID(), date: Date(), sensor: .gyroscope, time: 43.1, sensorData: SensorData(x: [1], y: [2], z: [3])),
    ]
    
    private var dataSource: UITableViewDiffableDataSource<Section, MeasuredData>?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.register(nil, forCellReuseIdentifier: )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIOption()
        configureTableView()
        configureDataSource()
    }
    
    private func configureUIOption() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "목록"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "측정",
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MeasuredData>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(measuredDataList, toSection: .main)
        dataSource?.apply(snapshot)
    }
}
