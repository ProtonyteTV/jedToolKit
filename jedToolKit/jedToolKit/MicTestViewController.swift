//
//  MicTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import AVFoundation

class MicTestViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    private var recordButton: UIButton!
    private var playButton: UIButton!
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Microphone Test"

        setupUI()
        requestMicrophonePermission()
    }

    private func setupUI() {
        recordButton = UIButton(type: .system)
        recordButton.setTitle("🎙️ Record (5s)", for: .normal)
        recordButton.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        recordButton.translatesAutoresizingMaskIntoConstraints = false

        playButton = UIButton(type: .system)
        playButton.setTitle("▶️ Play", for: .normal)
        playButton.addTarget(self, action: #selector(playRecording), for: .touchUpInside)
        playButton.isEnabled = false
        playButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(recordButton)
        view.addSubview(playButton)

        NSLayoutConstraint.activate([
            recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),

            playButton.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if !granted {
                DispatchQueue.main.async {
                    let alert = UIAlertController(
                        title: "Permission Required",
                        message: "Microphone access is needed for testing.",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }

    @objc private func startRecording() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .default)
            try session.setActive(true)

            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            audioRecorder = try AVAudioRecorder(url: getFileURL(), settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record(forDuration: 5) // Record for 5 seconds
            recordButton.setTitle("Recording...", for: .normal)
            recordButton.isEnabled = false
            playButton.isEnabled = false
        } catch {
            print("Failed to start recording: \(error)")
        }
    }

    @objc private func playRecording() {
        let url = getFileURL()
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playAndRecord, mode: .default)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)

            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch {
            print("Playback failed: \(error)")
        }
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        recordButton.setTitle("🎙️ Record (5s)", for: .normal)
        recordButton.isEnabled = true
        playButton.isEnabled = true
    }

    private func getFileURL() -> URL {
        let fileName = "mic_test.m4a"
        return FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
    }
}
