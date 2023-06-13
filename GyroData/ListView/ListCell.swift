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
        label.font = .preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private let sensorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let measuredTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
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
        leftStackView.spacing = 16
        
        let stackView = UIStackView(arrangedSubviews: [leftStackView, measuredTimeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
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
