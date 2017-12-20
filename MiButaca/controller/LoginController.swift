//
//  LoginController.swift
//  MiButaca
//
//  Created by Leticia on 7/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import Foundation

protocol LoginProtocol {
    
    func login(user: String, password: String)
    func loginResponse(response: Bool)
    func checkLogin()
    func getMovies()
}

class LoginController: LoginProtocol{
    var view: LoginViewController
    
    init(view: LoginViewController) {
        self.view = view
    }
    
    func login(user: String, password: String) {
        let model: FirebaseDataProtocol = FirebaseData()
        model.firebaseLogin(user: user, pass: password, view: view)
    }
    
    func loginResponse(response: Bool){
        if response{
            view.goToHome()
        }else{
            view.writeMessage(text: "Login Incorrecto")
        }
    }
    
    func checkLogin() {
        let userKey = Constants.userDefaults.user
        
        if userKey.isKeyPresentInUserDefaults(){
            view.goToHome()
        }
    }
    
    func getMovies(){
        
    }
    
}
