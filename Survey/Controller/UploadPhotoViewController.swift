//
//  UploadPhotoController.swift
//  Survey
//
//  Created by BTS.id on 28/07/22.
//

import UIKit
import Photos
import BSImagePicker

class UploadPhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    

    var myImages: [Data]! = [Data]()
    var selectedImage = [PHAsset]()
    var arrPhoto = [UIImage]()
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var pickerController: UIImagePickerController?
    
    
    @IBOutlet weak var PickImageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Upload Image"
        imageCollectionView.dataSource = self
    }
    
    @IBAction func uploadButtonTapped(_ sender: AnyObject) {
        openPhoto()
    }
    
    
    func openPhoto() {
        let imagePicker = ImagePickerController()

        presentImagePicker(imagePicker, select: { (asset) in

        }, deselect: { (asset) in

            }, cancel: { (assets) in

            }, finish: { (assets) in

                for i in 0..<assets.count {
                    self.selectedImage.append(assets[i])
                }
                self.convertAssetsToImages()
            }
        )
    }
    
    func convertAssetsToImages() -> Void {

        if selectedImage.count != 0 {

            

            for i in 0..<selectedImage.count {

                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                manager.requestImage(for: selectedImage[i], targetSize: CGSize(width: 200, height: 200), contentMode: PHImageContentMode.aspectFill, options: option, resultHandler: { (result, info) -> Void in
                        thumbnail = result!
                    })

                let data = thumbnail.jpegData(compressionQuality: 0.7)
                let newImage = UIImage(data: data!)
                self.arrPhoto.append(newImage! as UIImage)
                // This for send images data to another view cntroller for make request
                self.myImages.append(data!)

            }
            DispatchQueue.main.async {
                self.imageCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCollectionViewCell
        
        cell.imageView.image = self.arrPhoto[indexPath.row]
        
        return cell
    }

    
    
   

}
