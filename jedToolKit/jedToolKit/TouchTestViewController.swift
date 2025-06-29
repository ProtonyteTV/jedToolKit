//
//  TouchTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class TouchTestViewController: UIViewController {
 
    private var path = UIBezierPath()
    private var touchPoints: [CGPoint] = []
 
    private let canvasView = UIView()
    private let resetButton = UIButton(type: .system)
    private let infoLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Touch Test"
 
        setupCanvas()
        setupControls()
    }
 
    private func setupCanvas() {
        canvasView.frame = view.bounds.insetBy(dx: 10, dy: 100)
        canvasView.backgroundColor = UIColor.systemGray6
        canvasView.isUserInteractionEnabled = true
        canvasView.layer.cornerRadius = 12
        canvasView.clipsToBounds = true
        view.addSubview(canvasView)
    }
 
    private func setupControls() {
        infoLabel.text = "Draw with your finger to test touchscreen responsiveness."
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
 
        resetButton.setTitle("Reset Canvas", for: .normal)
        resetButton.addTarget(self, action: #selector(resetCanvas), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
 
        view.addSubview(infoLabel)
        view.addSubview(resetButton)
 
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
 
            resetButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
 
    // MARK: - Touches
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: canvasView)
        path = UIBezierPath()
        path.move(to: point)
        touchPoints.append(point)
        drawPath()
    }
 
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: canvasView)
        path.addLine(to: point)
        touchPoints.append(point)
        drawPath()
    }
 
    private func drawPath() {
        UIGraphicsBeginImageContext(canvasView.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            canvasView.layer.render(in: context)
            UIColor.systemBlue.setStroke()
            path.lineWidth = 2
            path.stroke()
        }
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
 
        let imageView = UIImageView(image: img)
        imageView.frame = canvasView.bounds
        canvasView.addSubview(imageView)
    }
 
    @objc private func resetCanvas() {
        canvasView.subviews.forEach { $0.removeFromSuperview() }
        touchPoints.removeAll()
    }
}
