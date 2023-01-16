//
//  ContentView.swift
//  RecognitionAppSwiftUI
//
//  Created by Sergio Ordaz Romero on 15/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("")
                    .resizable()
                    .border(Color.gray.opacity(0.5), width: 0.5)
                    .cornerRadius(35)
                    .background(.gray)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.red, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Image Analizer")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "camera")
                    }
                    
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
