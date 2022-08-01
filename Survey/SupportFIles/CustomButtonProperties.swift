//
//  customButtonProperties.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit

class CustomButtonProperties: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        config()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
        
    }
    
    func config(){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
    }

}
