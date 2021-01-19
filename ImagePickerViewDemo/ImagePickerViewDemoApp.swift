//
//  ImagePickerViewDemoApp.swift
//  ImagePickerViewDemo
//
//  Created by Alex Nagy on 19.01.2021.
//

import SwiftUI

@main
struct ImagePickerViewDemoApp: App {
    
    @State var selection = 1
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                UIImagePickerControllerContentView()
                    .tabItem { Image(systemName: "photo.fill") }
                    .tag(0)
                
                PHPickerViewControllerContentView()
                    .tabItem { Image(systemName: "photo.on.rectangle.angled") }
                    .tag(1)
            }
        }
    }
}
