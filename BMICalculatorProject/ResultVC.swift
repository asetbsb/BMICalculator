//
//  ResultVC.swift
//  BMICalculatorProject
//
//  Created by Asset on 10/29/24.
//

import UIKit

final class ResultVC: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    //MARK: - UIElements
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Your BMI:"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "21"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var adviceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "You are underweight"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x133E87)
        button.setTitle("Recalculate", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(backToRootVC), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addSubviews()
        fillContent()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(topLabel)
        view.addSubview(bmiLabel)
        view.addSubview(adviceLabel)
        view.addSubview(recalculateButton)
    }
    
    private func fillContent() {
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bmiLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            adviceLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 10),
            adviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            

            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20
            ),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    @objc private func backToRootVC() {
        dismiss(animated: true)
    }

}
