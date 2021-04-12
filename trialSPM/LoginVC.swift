//
//  LoginVC.swift
//  trialSPM
//
//  Created by k on 12/04/21.
//

import UIKit
import Kommunicate

class LoginVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let applicationId = (UIApplication.shared.delegate as! AppDelegate).appId
        setupApplicationKey(applicationId)

        guard let userIdEntered = userName.text, !userIdEntered.isEmpty else {
            let alertMessage = "Please enter a userId. If you are trying the app for the first time then just enter a random Id"
            let alert = UIAlertController(
                title: "Kommunicate login",
                message: alertMessage,
                preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let kmUser = userWithUserId(userIdEntered, andApplicationId: applicationId)

        print("userId:: ", kmUser.userId ?? "")
        if(!((emailId.text?.isEmpty)!)){
            kmUser.email = emailId.text
        }

        if (!((password.text?.isEmpty)!)){
            kmUser.password = password.text
        }
        registerUser(kmUser)
    }
    
    @IBAction func loginAsVisitorTapped(_ sender: Any) {
        activityIndicator.startAnimating()
        let applicationId = (UIApplication.shared.delegate as! AppDelegate).appId
        setupApplicationKey(applicationId)
        
        let kmUser = userWithUserId(Kommunicate.randomId(), andApplicationId: applicationId)
        registerUser(kmUser)
    }
    
    private func userWithUserId(
        _ userId: String,
        andApplicationId applicationId: String) -> KMUser {
        let kmUser = KMUser()
        kmUser.userId = userId
        kmUser.applicationId = applicationId
        return kmUser
    }
    
    private func setupApplicationKey(_ applicationId: String) {
        guard !applicationId.isEmpty else {
            fatalError("Please pass your AppId in the AppDelegate file.")
        }
        Kommunicate.setup(applicationId: applicationId)
    }
    
    private func registerUser(_ kmUser: KMUser) {
        Kommunicate.registerUser(kmUser, completion: {
            response, error in
            guard error == nil else {
                print("[REGISTRATION] Kommunicate user registration error: %@", error.debugDescription)
                return
            }
            print("User registration was successful: %@ \(String(describing: response?.isRegisteredSuccessfully()))")
            self.activityIndicator.stopAnimating()
            if let viewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "NavVC") as? UINavigationController {
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated:true, completion: nil)
            }
        })
    }
    
    
}
