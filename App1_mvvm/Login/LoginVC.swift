//
//  LoginVC.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 17.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {

    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag ()
    
    let alert = UIAlertController(title: "Error", message: "Wrong information", preferredStyle: UIAlertController.Style.alert)
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        if usernameTextField.text == "admin" && passwordTextField.text == "password" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        usernameTextField.rx.text.map { $0 ?? "" }.bind(to:
            loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        
        passwordTextField.rx.text.map { $0 ?? "" }.bind(to:
            loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)

        loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map { $0 ? 1 : 0.1}.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)

        
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
