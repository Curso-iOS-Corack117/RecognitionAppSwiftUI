//
//  ImageAnalizer.swift
//  RecognitionAppSwiftUI
//
//  Created by Sergio Ordaz Romero on 16/01/23.
//

import Foundation
import SwiftUI
import UIKit
import Vision

struct ImageAnalizer: UIViewControllerRepresentable {
    @Binding var image: UIImage
    @Binding var imageDescription: String
    @Environment(\.presentationMode) var presentationMode
    
    init(image: Binding<UIImage>, imageDescription: Binding<String>) {
        self._image = image
        self._imageDescription = imageDescription
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private var picker = UIImagePickerController()
    
    private var parent: ImageAnalizer
    
    init(_ parent: ImageAnalizer) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            DispatchQueue.main.async {
                self.parent.image = image
            }
            
            if let ciimage = CIImage(image: image) {            
                analize(with: ciimage)
                self.parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.parent.presentationMode.wrappedValue.dismiss()
    }
    
    func analize(with image: CIImage) {
        if let model = try? VNCoreMLModel(for: ImageRecognitionModelMaker(configuration: .init()).model) {
            let request = VNCoreMLRequest(model: model) { request, error in
                let firstResult = request.results!.first as! VNClassificationObservation
                DispatchQueue.main.async {
                    self.parent.imageDescription = firstResult.identifier
                }
            }
            let handler = VNImageRequestHandler(ciImage: image)
            do {
                try handler.perform([request])
            } catch {
                print("Error analizing the photo")
            }
        }
    }
}
