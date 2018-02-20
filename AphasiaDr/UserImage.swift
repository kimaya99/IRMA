//
//  UserImage.swift
//  AphasiaDrill
//
//  Created by Kimaya Desai on 12/6/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import Firebase

extension CreateUserViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    

    @objc func handleSelectProfileImage(){
        let picker = UIImagePickerController()
        present(picker,animated:true,completion:nil)
        picker.delegate = self
        picker.allowsEditing = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Picker cancelled")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            print(info)
            selectedImageFromPicker = editedImage
        }
        else if let  originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
        print(info)
            selectedImageFromPicker = originalImage
    }
        if var selectedImage = selectedImageFromPicker {
            profileImage.image = selectedImage
        }
       dismiss(animated: true, completion: nil)
    }
}
