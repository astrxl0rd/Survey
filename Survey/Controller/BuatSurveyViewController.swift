//
//  BuatSurveyViewController.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit
import Alamofire
import MobileCoreServices

struct responseUser: Decodable{
    let id: String!
    let createdAt: String!
}

class BuatSurveyViewController: UIViewController {
    
    @IBOutlet weak var namaSurvey: UITextField!
    @IBOutlet weak var luasTanah: UITextField!
    @IBOutlet weak var luasBangunan: UITextField!
    @IBOutlet weak var deskripsiBangunan: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Survey"
        
    }
    
    
    @IBAction func postRequest(_ sender: Any){
        guard let namaSurvey = self.namaSurvey.text else {return}
        guard let luasTanah = self.luasTanah.text else {return}
        
        let parameters: [String: String] = [
            
            "name": namaSurvey,
            "job":  luasTanah
            
        ]
        createUser(parameters: parameters, completionHandler: {
            (result) in
            if result {
                let alert = UIAlertController(
                    title: "sukses", message: "data berhasil disimpan", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "okay", style: .default))
                self.present(alert, animated: true, completion: nil)
                
                //clear textfield
                
                self.namaSurvey.text = ""
                self.luasTanah.text = ""
                
            } else{
                print("gagal menyimpan data")
            }
        })
        
        
    }
    
    func createUser (parameters: [String: String], completionHandler: @escaping (Bool) -> Void){
        
        var sURL: String!
        sURL = "https://reqres.in/api/users"
        
        AF.upload(multipartFormData:{multipartformData in
            for (key, value) in parameters{
                multipartformData.append(Data("\(value)".utf8), withName: key)
            }
        } , to: sURL, method: .post).responseDecodable(of: responseUser.self){
            (response) in
            switch response.result {
            case .success(_):
                completionHandler(true)
            case .failure(let error):
                print("error: \(error)")
            }
        }
        
    }
    
    
    
}
