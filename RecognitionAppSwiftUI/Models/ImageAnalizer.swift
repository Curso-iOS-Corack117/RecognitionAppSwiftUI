//
//  ImageAnalizer.swift
//  RecognitionAppSwiftUI
//
//  Created by Sergio Ordaz Romero on 16/01/23.
//

import Foundation
import SwiftUI
import UIKit

struct ImageAnalize {
    
    
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private var picker = UIImagePickerController()
    
    override init() {
        super.init()
        picker.delegate = self
    }
}
