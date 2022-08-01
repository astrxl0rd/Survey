//
//  CustomThumbnailImage.swift
//  Survey
//
//  Created by BTS.id on 28/07/22.
//

import UIKit

class CustomThumbnailImage: UIImageView {

    override init(frame: CGRect){
        super.init(frame: frame)
        config()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
        
    }
    
    func config(){
        self.layer.cornerRadius = self.frame.width/2
//        self.layer.borderWidth = 3
//        self.layer.borderColor = UIColor.systemBlue.cgColor
//        self.layer.borderColor = UIColor.systemBlue.cgColor
    }
}
