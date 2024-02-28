// Feb 28, 2024
// Eric
// On my honor I have not recieved any unauthorized aid
// This is where we will write Swift to run our custom trained YOLO model
// to do this we need to import these libraries, as well as UIKit since AVFoundation does not work with SwiftUI yet...
import Vision
import AVFoundation
import UIKit
import SwiftUI

// make a public variable accessable everywhere about what the user is looking at right now
public var current_detection = "N/A"

// Using the concepts of inheritance we will now extend the ViewController in the Camera View to do ML
extension ViewController {
    // this sets up the YOLO model
    func setupDetector() {
        // find path to our CoreML model
        let modelURL = Bundle.main.url(forResource: "HOMAN2.1", withExtension: "mlmodelc")
        
        // load int he model, objects recognized rn, and its requests
        do {
            let visionModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL!))
            // it's nice that we can make a custom completionHandler with CoreML so we can check when the AI is doe
            let recognitions = VNCoreMLRequest(model: visionModel, completionHandler: detectionDidComplete)
            self.requests = [recognitions]
        } catch let error {
            // debugging
            print(error)
        }
    }
    
    // completion handler mtd
    func detectionDidComplete(request: VNRequest, error: Error?) {
        // Put in our Async queue again because we do not want to wait for the model to do other things
        // once it's done making detections, extract the detections over to results
        DispatchQueue.main.async(execute: {
            if let results = request.results {
                self.extractDetections(results)
            }
        })
    }
    
    // functons to extract detections every frame, b/c of our special need, we need to write a filtering algorithm that gets the highest confidence object
    func extractDetections(_ results: [VNObservation]) {
        // set our detection sublayers incase we want bounding boxes in future
        // initialize a counting Float to keep track of the highest confidence in this frame
        var highest_conf: Float = 0.0
        // for all the observations
        for observation in results where observation is VNRecognizedObjectObservation {
            guard let objectObservation = observation as? VNRecognizedObjectObservation else { continue }
            // if the current observation's confidence is lower than our highest confidence, discard the recognition
            if objectObservation.confidence < highest_conf{
                continue
            }
            // if it is higher, we set the highest confidence values of this frame to this object, and set the detection to this object as well
            highest_conf = objectObservation.confidence
            let topLabelObservation = objectObservation.labels[0]
            current_detection = topLabelObservation.identifier
            // print for ez debugging on macbook of what the model sees
            print(current_detection)
        }

    }
    
    // this is what ties it all together, we take what AVFoundation sees in the current frame, and then set this over to Apple's VNImageRequestHandler to get our results
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // get the pixelBuffer of the current frame
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        // input this buffer over to the request handler
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        // schdule the request!
        do {
            try imageRequestHandler.perform(self.requests)
        } catch {
            // debugging
            print(error)
        }
    }
}
