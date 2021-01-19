//
//  UIImagePickerControllerContentView.swift
//  ImagePickerViewDemo
//
//  Created by Alex Nagy on 19.01.2021.
//

import SwiftUI
import ImagePickerView

struct UIImagePickerControllerContentView: View {
    
    @State var isImagePickerViewPresented = false
    @State var pickedImage: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 12) {
            Text("UIImagePickerView").font(.largeTitle)
            
            Button {
                isImagePickerViewPresented = true
            } label: {
                VStack {
                    if pickedImage == nil {
                        Image(systemName: "camera")
                            .font(.largeTitle)
                    } else {
                        Image(uiImage: pickedImage!)
                            .resizable()
                            .frame(width: 66, height: 66)
                            .cornerRadius(33)
                    }
                }
            }
            .sheet(isPresented: $isImagePickerViewPresented) {
                UIImagePickerView(allowsEditing: true, delegate: UIImagePickerView.Delegate(isPresented: $isImagePickerViewPresented, didCancel: { (uiImagePickerController) in
                    print("Did Cancel: \(uiImagePickerController)")
                }, didSelect: { (result) in
                    let uiImagePickerController = result.picker
                    let image = result.image
                    print("Did Select image: \(image) from \(uiImagePickerController)")
                    pickedImage = image
                }))
            }
            
            Spacer()
        }
    }
}

struct UIImagePickerControllerContentView_Previews: PreviewProvider {
    static var previews: some View {
        UIImagePickerControllerContentView()
    }
}
