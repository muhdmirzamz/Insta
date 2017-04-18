//
//  UploadViewController.swift
//  Insta
//
//  Created by Muhd Mirza on 26/3/17.
//  Copyright © 2017 muhdmirzamz. All rights reserved.
//

import UIKit

protocol UploadProtocol {
	func reloadCollectionView(WithData data: PhotoItem)
}

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var captionField: UITextField!
	
	var delegate: UploadProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.captionField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func getPhotoFromLibrary() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = self
		
		self.present(imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func upload() {
		let image = self.imageView.image
		let caption = self.captionField.text!
		
		let photoItem = PhotoItem.init(image: image!, and: caption)
		
		self.delegate?.reloadCollectionView(WithData: photoItem)
		
		// https://forums.developer.apple.com/thread/64947
		_ = self.navigationController?.popViewController(animated: true)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let image = info[UIImagePickerControllerOriginalImage] as? UIImage
		
		self.imageView.image = image
		
		self.dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		self.dismiss(animated: true, completion: nil)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return self.captionField.resignFirstResponder()
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
