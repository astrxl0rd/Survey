//
//  BuatSurveyViewController.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit
import Alamofire
import MobileCoreServices

class BuatSurveyViewController: UIViewController {
    
    struct RequestBodyFormDataKeyValue{
        var email: String
        var first_name: String 
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Survey"
        
    }
    
    
    @IBAction func postRequest(_ sender: Any){
        var bodyKeyValue = [RequestBodyFormDataKeyValue]()
        
        bodyKeyValue.append(RequestBodyFormDataKeyValue(email: "a", first_name: "b"))
        bodyKeyValue.append(RequestBodyFormDataKeyValue(email: "c", first_name: "d"))
        bodyKeyValue.append(RequestBodyFormDataKeyValue(email: "e", first_name: "f"))
        
        var sURL: String!
        sURL = "http://reqres.in/api/users"
        
        let serializer = DataResponseSerializer(emptyResponseCodes: Set([200,204,205]))
        
        var sampleRequest = URLRequest(url: URL(string: sURL)!)
        sampleRequest.httpMethod = HTTPMethod.post.rawValue
        
        AF.upload(multipartFormData: {multipartFormData in
            
            for formData in bodyKeyValue{
                multipartFormData.append(Data(formData.first_name.utf8), withName: formData.email)
            }
            
        }, to: sURL, method: .post)
        .uploadProgress{progress in
            print(CGFloat(progress.fractionCompleted))
        }.response{response in
            
            if (response.error == nil){
                var responseString: String!
                responseString = ""
                
                if (response.data != nil){
                    responseString = String(bytes: response.data!, encoding: .utf8)
                }else{
                    responseString = response.response?.description
                }
                
                print(responseString ?? "")
                print(response.response?.statusCode)
                
            }
        }
    }
    


}
