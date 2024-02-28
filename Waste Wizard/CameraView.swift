// Eric
// On my honor I have not recieved any unauthorized aid
// Sources: How to build a Camera App: Apple Dev Docs-
// https://developer.apple.com/documentation/avfoundation/capture_setup/avcam_building_a_camera_app
// this is where we code the AVFoundation Camera Feed w/o the AI model
// import Foundation and UIKit because AVFoundation does not support SwiftUI

import Foundation
import UIKit
import SwiftUI
import AVFoundation
import Vision


// setup a UIkit ViewController that uses AVFoundation capturing
class  ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    // init a new AVFoundation capture session
    private let captureSession = AVCaptureSession()
    // var for if we have cam perms from user
    private var permissionGranted = false
    // image dispatch queue
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    // our camera preview layer that lets us display what the camera sees
    private var previewLayer = AVCaptureVideoPreviewLayer()
    // screen rectange for the preview layer to be in
    var screenRect: CGRect! = nil
    
    // store our AVFoundation video output as well
    private var videoOutput = AVCaptureVideoDataOutput()
    // initialize requests for our Vision Model
    var requests = [VNRequest]()
    // detection layer for the ML model
    var detectionLayer: CALayer! = nil
    
    // we override the default viewDidLoad function 
    override func viewDidLoad(){
        // check for camera perms
        checkPermission()
        // create an asynchronous queue that runs our session and AI setups
        sessionQueue.async {
            [unowned self] in
            guard permissionGranted else { return }
            self.setupCaptureSession()
            self.setupDetector()
            self.captureSession.startRunning()
        }
    }
    
    // checks the user for camera perms
    func checkPermission() {
        // variable in the switch is if the user has given video perms or no
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            // if we get access set this to true
        case .authorized:
            permissionGranted = true
        case .notDetermined:
            requestPermission()
        default:
            permissionGranted = false
        }
    }
    
    // override the willTransition function to keep the video in portrait mode all the time
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator){
        screenRect = UIScreen.main.bounds
        self.previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        // here we are saying that no matter what orientation the phone is in we set the video to portrait
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
    }
    
    // ask for camera permissions
    func requestPermission() {
        // stop the queue before b/c its gonna crash if we get rejected perms
        sessionQueue.suspend()
        // ask for camera perms using AVCaptureDevice
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {[unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        })
    }
    
    // <-------- portion heavily references apple's AVFoundation documentation----------->
    // setting up the camera session with AVFoundation
    func setupCaptureSession() {
        // choose the camera to be the Wide angle camera (most iphones have this) in the back
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {return}
        // set the video input to the AVCaptureDeviceInput so we get the video
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {return}
        // check if we can add the input to the captureSession
        guard captureSession.canAddInput(videoDeviceInput) else {return}
        // add the input to the AVCaptureSession
        captureSession.addInput(videoDeviceInput)
        // using UIkit display the video feed
        screenRect = UIScreen.main.bounds
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        // setting the UIkit frame
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        previewLayer.zPosition = 0
        // setSampleBufferDelegate to delegate the image buffer
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        // add the videoOutput to the Capture session
        captureSession.addOutput(videoOutput)
        videoOutput.connection(with: .video)?.videoOrientation = .portrait
        // add in the model's preview layer
        DispatchQueue.main.async { [weak self] in self!.view.layer.addSublayer(self!.previewLayer)}
    }
}

// Camera view features a ViewController and it has an update mtd to update that view controller
struct CameraView: UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

// <--------- End of portion heavily referencing apple's AVFoundation docs ------------->
