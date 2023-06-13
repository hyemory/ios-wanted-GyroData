//
//  AddDataViewController.swift
//  GyroData
//
//  Created by Hyejeong Jeong on 2023/06/13.
//

import UIKit

final class AddDataViewController: UIViewController {
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Acc", "Gyro"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("측정", for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("정지", for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIOption()
        configureLayout()
    }
    
    private func configureUIOption() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "측정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장",
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
    }
    
    private func createContentsStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [segmentControl, startButton, stopButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }
    
    private func configureLayout() {
        let stackView = createContentsStackView()
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
