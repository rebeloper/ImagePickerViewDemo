//
//  PHPickerViewControllerContentView.swift
//  ImagePickerViewDemo
//
//  Created by Alex Nagy on 19.01.2021.
//

import SwiftUI
import ImagePickerView

struct PHPickerViewControllerContentView: View {
    
    @State var isImagePickerViewPresented = false
    @State var pickedImages: [UIImage]? = nil
    
    var body: some View {
        VStack(spacing: 12) {
            Text("ImagePickerView").font(.largeTitle)
            
            Button {
                isImagePickerViewPresented = true
            } label: {
                VStack {
                    Image(systemName: "camera")
                        .font(.largeTitle)
                }
            }
            .sheet(isPresented: $isImagePickerViewPresented) {
                // filter default is .images; please DO NOT CHOOSE .videos
                // selectionLimit default is 1; set to 0 to have unlimited selection
                ImagePickerView(filter: .any(of: [.images, .livePhotos]), selectionLimit: 0, delegate: ImagePickerView.Delegate(isPresented: $isImagePickerViewPresented, didCancel: { (phPickerViewController) in
                    print("Did Cancel: \(phPickerViewController)")
                }, didSelect: { (result) in
                    let phPickerViewController = result.picker
                    let images = result.images
                    print("Did Select images: \(images) from \(phPickerViewController)")
                    pickedImages = images
                }, didFail: { (imagePickerError) in
                    let phPickerViewController = imagePickerError.picker
                    let error = imagePickerError.error
                    print("Did Fail with error: \(error) in \(phPickerViewController)")
                }))
            }
            
            if pickedImages != nil {
                ScrollView {
                    ForEach(pickedImages!, id:\.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 66, height: 66)
                            .cornerRadius(33)
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct PHPickerViewControllerContentView_Previews: PreviewProvider {
    static var previews: some View {
        PHPickerViewControllerContentView()
    }
}
