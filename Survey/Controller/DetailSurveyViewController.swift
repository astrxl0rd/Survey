//
//  DetailSurveyViewController.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit

class DetailSurveyViewController: UIViewController {
    
    var imageData = ""
    var namaSurveyData = ""
    
    
    
    
    @IBOutlet weak var primaryImage: UIImageView!
    @IBOutlet weak var namaSurvey: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail Survey"
        
        primaryImage.downloaded(from: imageData)
        namaSurvey.text = namaSurveyData
        
        
    }
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
