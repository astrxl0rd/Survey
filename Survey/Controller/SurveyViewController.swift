//
//  SurveyViewController.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit
import Alamofire
//import AlamofireImage


struct User: Decodable{
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}


struct Pages: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    var data: [User]
    
}



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .center) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class SurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var surveyTableView: UITableView!
    
    //      [data dummy]
    //    let primaryImageThumbnail = [UIImage(named:"gambarBangunanz")]
    //    let namaSurvey = ["meikartaz"]
    
    
    var pages = [Pages]()
    var idx: Int = 0
    
    var page = 0
    var per_page = 0
    let total: Int = 12
    var total_pages = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        title = "Survey"
        surveyTableView.dataSource = self
        surveyTableView.delegate = self
        getRequest(){
            (result) in
            
            self.page = result.page
            self.per_page = result.per_page
            self.total_pages = result.total
            
            
            self.pages.append(result)
            self.surveyTableView.reloadData()
            
            print(self.pages)
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        
    }
    
    func getRequest(page: Int = 1, completionHandler: @escaping (Pages) -> Void){
        var sURL: String!
        sURL = "https://reqres.in/api/users?page=2"
        
        
        AF.request(sURL, parameters: ["page": page]).responseDecodable(of: Pages.self){
            (response) in
            switch response.result {
            case .success(let data):
                completionHandler(data)
            case .failure(let error):
                print("error: \(error)")
            }
            
        }
    }
    
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.pages.flatMap(\.data).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = surveyTableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! SurveyListTableViewCell
        //
        //        tableCell.primaryImageThumbnail?.image = primaryImageThumbnail[indexPath.row]
        //        tableCell.namaSurvey?.text = namaSurvey[indexPath.row]
        let userFlatMap = self.pages.flatMap(\.data)[indexPath.row]
        
        tableCell.primaryImageThumbnail.contentMode = .scaleToFill
        tableCell.primaryImageThumbnail.downloaded(from: userFlatMap.avatar)
        
        tableCell.namaSurvey.text = userFlatMap.first_name
//        tableCell.delegate = self
        
        
        
        return tableCell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let useFlatMap = self.pages.flatMap(\.data)[indexPath.row]
        
//        print(useFlatMap.first_name)
        
        let navDetail = storyboard?.instantiateViewController(identifier: "detail") as! DetailSurveyViewController
        
        navDetail.imageData = useFlatMap.avatar
        navDetail.namaSurveyData = useFlatMap.first_name
        
        navigationController?.pushViewController(navDetail, animated: true)
        
        
        
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
