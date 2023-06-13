//
//  ListCell.swift
//  GyroData
//
//  Created by Hyejeong Jeong on 2023/06/13.
//

import UIKit

final class ListCell: UITableViewCell {
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private let sensorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let measuredTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(date: String, sensorName: String, measuredTime: String) {
        dateLabel.text = date
        sensorNameLabel.text = sensorName
        measuredTimeLabel.text = measuredTime
    }
    
    private func createCellStackView() -> UIStackView {
        let leftStackView = UIStackView(arrangedSubviews: [dateLabel, sensorNameLabel])
        leftStackView.axis = .vertical
        leftStackView.distribution = .fill
        leftStackView.alignment = .fill
        leftStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [leftStackView, measuredTimeLabel])
        leftStackView.axis = .horizontal
        leftStackView.distribution = .fill
        leftStackView.alignment = .fill
        leftStackView.spacing = 12
        return stackView
    }
    
    private func configureLayout() {
        let stackView = createCellStackView()
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
