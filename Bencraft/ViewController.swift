//
//  ViewController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 8/30/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendEmail(_ sender: UIButton) {
        
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: "https://api.mailgun.net/v3/sandbox0f8417ed9c56413a821c30b4be88f3ef.mailgun.org/messages")! as URL)
        request.httpMethod = "POST"
        
        // Basic Authentication
        let username = "api"
        let password = "7be009135447af0018f7f3f94fd8855d-4167c382-8accc436"
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.data(using: String.Encoding.utf8.rawValue)! as NSData
        let base64LoginString = loginData.base64EncodedString(options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let bodyStr = "from=CeitbAPP <mailgun@sandbox0f8417ed9c56413a821c30b4be88f3ef.mailgun.org>&to=Ceitba <mcraviotto@itba.edu.ar>&subject=Notificación&text=Hubo una modificación para el alumno: Martin Craviotto. \nSe desea inscribir en: Gimnasio"
        
        // appending the data
        request.httpBody = bodyStr.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            print(response)
        })
        
        task.resume()

    }
    
}

