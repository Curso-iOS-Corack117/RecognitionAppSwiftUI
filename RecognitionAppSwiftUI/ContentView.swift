//
//  ContentView.swift
//  RecognitionAppSwiftUI
//
//  Created by Sergio Ordaz Romero on 15/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var imageDescription: String = ""
    @State private var image = UIImage()
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Image Analizer")
                            .font(.system(size: 35, weight: .semibold, design: .default))
                        Text("Objeto analizado: " + imageDescription)
                    }
                    Spacer()
                    NavigationLink {
                        ImageAnalizer(image: $image, imageDescription: $imageDescription)
                            .background(.black)
                            .toolbar(.hidden)
                    } label: {
                        Image(systemName: "camera")
                            .padding(10)
                            .background(.opacity(0.3))
                            .cornerRadius(5)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
                .background(.red)
                .foregroundColor(.white)
                Divider()
                    .frame(minHeight: 1)
                    .background(.clear)
                
                //Body
                VStack {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.gray)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
