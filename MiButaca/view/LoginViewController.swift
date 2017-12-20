//
//  LoginViewController.swift
//  MiButaca
//
//  Created by Leticia on 7/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: CustomLoginTextfield!
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let controller: LoginProtocol = LoginController(view: self)
        controller.checkLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        let controller: LoginProtocol = LoginController(view: self)
        controller.login(user: txtUser.text!, password: txtPass.text!)
    }
    
    func goToHome(){
        lblMessage.isHidden = true
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: Constants.segue.LoginToHome, sender: nil)
        }
        
    }
    
    func writeMessage(text: String){
        lblMessage.text = text
        lblMessage.isHidden = false
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class CustomLoginTextfield: UITextField{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.tintColor = UIColor().customYellow()
        //self.layer.sublayerTransform = CATransform3DMakeTranslation(0, 0, 0)
        if self.tag == 0{
            self.addImageLeft(image: UIImage(named: "icons8-user-32.png")!, width: 35, height: 35)
        }else{
            self.addImageLeft(image: UIImage(named: "icons8-lock-32.png")!, width: 35, height: 35)
        }
        
        self.leftView?.alpha = 0.3
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, 40, 0, 0))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(10, 40, 0, 0))
    }
}
