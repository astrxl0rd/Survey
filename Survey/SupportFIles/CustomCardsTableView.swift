//
//  CustomCardsTableView.swift
//  Survey
//
//  Created by BTS.id on 02/08/22.
//

import UIKit

class CustomCardsTableView: UIButton {
    
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
        self.layer.borderWidth = 0.001
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.35
        
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
