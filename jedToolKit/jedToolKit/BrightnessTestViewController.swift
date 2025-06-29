//
//  BrightnessTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class BrightnessTestViewController: UIViewController {
 
    private let slider = UISlider()
    private let brightnessLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Brightness Test"
        view.backgroundColor = .systemBackground
        setupUI()
        updateBrightnessLabel()
    }
 
    private func setupUI() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = Float(UIScreen.main.brightness)
        slider.addTarget(self, action: #selector(brightnessChanged), for: .valueChanged)
 
        brightnessLabel.translatesAutoresizingMaskIntoConstraints = false
        brightnessLabel.font = .systemFont(ofSize: 16, weight: .medium)
        brightnessLabel.textAlignment = .center
 
        view.addSubview(slider)
        view.addSubview(brightnessLabel)
 
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
 
            brightnessLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -20),
            brightnessLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            brightnessLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
 
    @objc private func brightnessChanged() {
        let brightness = CGFloat(slider.value)
        UIScreen.main.brightness = brightness
        updateBrightnessLabel()
    }
 
    private func updateBrightnessLabel() {
        let percentage = Int(UIScreen.main.brightness * 100)
        brightnessLabel.text = "Brightness: \(percentage)%"
    }
}
