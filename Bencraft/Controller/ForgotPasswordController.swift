//
//  ForgotPasswordController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 12/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
class ForgotPasswordController: UIViewController {

    @IBOutlet weak var mail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.

    }
    @IBAction func didEndOnExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @objc func endEditing() {
        view.endEditing(true)
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
        
        let userMail = mail.text
        
        let bodyStr = "from=CeitbAPP <mailgun@sandbox0f8417ed9c56413a821c30b4be88f3ef.mailgun.org>&to=Ceitba <\(userMail ?? "")>&subject=Reestablecer contraseña&text=Hubo una modificación para el alumno: \(userMail ?? ""). \nSe desea inscribir en: Gimnasio"
        
        // appending the data
        request.httpBody = bodyStr.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            print(response)
        })
        
        task.resume()
        
        let alert = UIAlertController(title: "Si el mail ingresado es válido, se va a enviar un mail con las instrucciones para reestablecer la contraseña.", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
