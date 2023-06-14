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
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIOption()
        configureTableView()
        configureDataSource()
        applySnapshot()
    }
    
    private func configureUIOption() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "목록"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "측정",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pushAddDataView))
    }
    
    @objc private func pushAddDataView() {
        let addDataViewController = AddDataViewController()
        
        navigationController?.pushViewController(addDataViewController, animated: true)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, MeasuredData>(tableView: tableView) {
            [weak self] (tableView, indexPath, data) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell else {
                return UITableViewCell()
            }
            
            let measuredData = self?.measuredDataList[indexPath.row]
            
            guard let date = measuredData?.date.translateDayFormat(),
                  let sensorName = measuredData?.sensor.title,
                  let measuredTime = measuredData?.time else {
                return UITableViewCell()
            }
            
            cell.configure(date: date, sensorName: sensorName, measuredTime: String(measuredTime))
            return cell
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MeasuredData>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(measuredDataList, toSection: .main)
        dataSource?.apply(snapshot)
    }
}

// MARK: - Table view delegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = measuredDataList[indexPath.row]
        
        // 다시보기 페이지 이동 구현 필요 (View 타입)
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let playAction = UIContextualAction(style: .normal, title: "Play") { [weak self] _, _, _ in
            // 다시보기 페이지 이동 구현 필요 (Play 타입)
        }
        playAction.backgroundColor = .systemGreen
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, _ in
            // 데이터 삭제 구현 필요
            
            self?.measuredDataList.remove(at: indexPath.row)
            self?.applySnapshot()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, playAction])
    }
}
