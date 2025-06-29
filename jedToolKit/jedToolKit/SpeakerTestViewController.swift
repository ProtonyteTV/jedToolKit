//
//  SpeakerTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import AVFoundation
 
class SpeakerTestViewController: UIViewController {
 
    private var player: AVAudioPlayer?
    private let playButton = UIButton(type: .system)
    private let statusLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Speaker Test"
        setupUI()
        prepareAudio()
    }
 
    private func setupUI() {
        playButton.setTitle("🔊 Play Test Sound", for: .normal)
        playButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
 
        statusLabel.text = "Tap the button to test speaker output."
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0
        statusLabel.font = .systemFont(ofSize: 16)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
 
        view.addSubview(playButton)
        view.addSubview(statusLabel)
 
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
 
            statusLabel.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
 
    private func prepareAudio() {
        guard let soundURL = Bundle.main.url(forResource: "test_sound", withExtension: "mp3") else {
            statusLabel.text = "❌ Missing test sound file."
            return
        }
 
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            statusLabel.text = "⚠️ Failed to prepare audio: \(error.localizedDescription)"
        }
    }
 
    @objc private func playSound() {
        player?.stop()
        player?.currentTime = 0
        player?.play()
        statusLabel.text = "🔈 Playing test sound…"
    }
}
