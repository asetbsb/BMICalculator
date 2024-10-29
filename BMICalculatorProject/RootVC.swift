//
//  ViewController.swift
//  BMICalculatorProject
//
//  Created by Asset on 10/29/24.
//

import UIKit

final class RootVC: UIViewController {
    
    private var calculatorBrain = CalculatorBrain()
    
    //MARK: - UIElements
    
    private lazy var labelView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bottomStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "Calculate Your BMI"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.text = "height"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.text = "weight"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 3.0
        slider.value = 1.5
        slider.thumbTintColor = UIColor(rgb: 0x133E87)
        slider.maximumTrackTintColor = UIColor(rgb: 0xCBDCEB)
        slider.minimumTrackTintColor = UIColor(rgb: 0x608BC1)
        slider.addTarget(self, action: #selector(changeMeasurements(_:)), for: .valueChanged)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 300.0
        slider.value = 150.0
        slider.thumbTintColor = UIColor(rgb: 0x133E87)
        slider.maximumTrackTintColor = UIColor(rgb: 0xCBDCEB)
        slider.minimumTrackTintColor = UIColor(rgb: 0x608BC1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(changeMeasurements(_:)), for: .valueChanged)
        
        return slider
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x133E87)
        button.setTitle("Calculate BMI", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helper Lifecycle Functions
    
    private func setupUI() {
        view.backgroundColor = UIColor(rgb: 0xF3F3E0)
        addSubviews()
        setViewConstraints()
        setElementsConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(labelView)
        view.addSubview(bottomStackview)
        view.addSubview(titleLabel)
        
        bottomStackview.addArrangedSubview(heightLabel)
        bottomStackview.addArrangedSubview(heightSlider)
        bottomStackview.addArrangedSubview(weightLabel)
        bottomStackview.addArrangedSubview(weightSlider)
        bottomStackview.addArrangedSubview(calculateButton)
    }
    
    private func setViewConstraints() {
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            labelView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.5
            ),
            
            bottomStackview.topAnchor.constraint(equalTo: labelView.bottomAnchor),
            bottomStackview.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20
            ),
            bottomStackview.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20
            ),
            bottomStackview.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12
            )
        ])
    }
    
    private func setElementsConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
        ])
    }
    
    //MARK: - Action Functions
    
    @objc private func calculateBMI() {
        let height = heightSlider.value
        let weight = weightSlider.value
        let resultVC = ResultVC()

        calculatorBrain.calculateBMI(height: height, weight: weight)
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()
        
        present(resultVC, animated: true)
    }
    
    @objc private func changeMeasurements(_ sender: UISlider) {
        if sender==heightSlider {
            heightLabel.text = "Height: \(String(format: "%.2f", sender.value))m"
        }
        else {
            weightLabel.text = "Weight: \(String(format: "%.0f", sender.value))kg"
        }
    }
}

