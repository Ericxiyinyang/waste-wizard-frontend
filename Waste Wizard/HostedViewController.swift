import Foundation
import UIKit
import SwiftUI
import AVFoundation
import Vision

class  ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    private let captureSession = AVCaptureSession()
    private var permissionGranted = false
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect: CGRect! = nil
    
    private var videoOutput = AVCaptureVideoDataOutput()
    var requests = [VNRequest]()
    var detectionLayer: CALayer! = nil
    
    override func viewDidLoad(){
        checkPermission()
        
        sessionQueue.async {
            [unowned self] in
            guard permissionGranted else { return }
            self.setupCaptureSession()
            self.setupLayers()
            self.setupDetector()
            self.captureSession.startRunning()
        }
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            permissionGranted = true
        case .notDetermined:
            requestPermission()
        default:
            permissionGranted = false
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator){
        screenRect = UIScreen.main.bounds
        self.previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        switch UIDevice.current.orientation{
        case UIDeviceOrientation.portraitUpsideDown:
            self.previewLayer.connection?.videoOrientation = .portrait
        case UIDeviceOrientation.landscapeLeft:
            self.previewLayer.connection?.videoOrientation = .portrait
        case UIDeviceOrientation.landscapeRight:
            self.previewLayer.connection?.videoOrientation = .portrait
        case UIDeviceOrientation.portrait:
            self.previewLayer.connection?.videoOrientation = .portrait
        default:
            break
        }
        
        //obj detection
        updateLayers()
    }
    
    func requestPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {[unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        })
    }
    
//    private let shutterButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        button.layer.cornerRadius = 100
//        button.layer.borderWidth = 10
//        button.layer.borderColor = UIColor.white.cgColor
//        return button
//    }()
    
    func setupCaptureSession() {
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {return}
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {return}
        guard captureSession.canAddInput(videoDeviceInput) else {return}
        captureSession.addInput(videoDeviceInput)
        screenRect = UIScreen.main.bounds
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        previewLayer.zPosition = 0
//        shutterButton.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height - 200)
        //obj detection
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSession.addOutput(videoOutput)
        videoOutput.connection(with: .video)?.videoOrientation = .portrait
        DispatchQueue.main.async { [weak self] in self!.view.layer.addSublayer(self!.previewLayer)}
    }
}

struct HostedViewController: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
