//
//  SurveyViewController.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit

class SurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var surveyTableView: UITableView!
    
    
    let primaryImageThumbnail = [UIImage(named:"gambarBangunanz")]
    let namaSurvey = ["meikartaz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Survey"
        surveyTableView.dataSource = self
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namaSurvey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = surveyTableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! SurveyListTableViewCell
        
        tableCell.primaryImageThumbnail?.image = primaryImageThumbnail[indexPath.row]
        tableCell.namaSurvey?.text = namaSurvey[indexPath.row]
        
        
        
        return tableCell
        
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
