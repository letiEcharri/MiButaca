//
//  FirebaseData.swift
//  MiButaca
//
//  Created by Leticia on 7/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit
import FirebaseDatabase

protocol FirebaseDataProtocol {
    func firebaseLogin(user: String, pass: String, view: LoginViewController)
    func firebaseGetMovies(controller: MoviesTableProtocol)
}

class FirebaseData: FirebaseDataProtocol {
    var ref: DatabaseReference!
    var tableUsers = "users"
    
    init() {
        
    }
    
    func firebaseLogin(user: String, pass: String, view: LoginViewController){
        var userValid: Bool = false
        var passValid: Bool = false
        var idUser: String = ""
        ref = Database.database().reference()
        
        ref.child(tableUsers).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let array: NSArray = snapshot.children.allObjects as NSArray
            
            for child in array{
                let snap = child as! DataSnapshot
                if snap.value is NSDictionary{
                    let data: NSDictionary = snap.value as! NSDictionary
                    
                    for i in data{
                        if i.key as! String == "nick"{
                            if i.value as! String == user{
                                userValid = true
                            }
                            print(i.value)
                        }
                        
                        if i.key as! String == "password"{
                            print(i.value)
                            if i.value as! String == pass{
                                passValid = true
                            }
                        }
                        
                        if i.key as! String == "id"{
                            idUser = i.value as! String
                        }
                    }
                    
                }
            }
            
            let controller: LoginProtocol = LoginController(view: view)
            
            if userValid == true && passValid == true{
                print("USUARIO VÁLIDO")
                UserDefaults.standard.set(user, forKey: Constants.userDefaults.user)
                UserDefaults.standard.set(idUser, forKey: Constants.userDefaults.userID)
                controller.loginResponse(response: true)
            }else{
                print("USUARIO ERRONEO")
                controller.loginResponse(response: false)
            }
        })
        
        
    }
    
    func firebaseGetMovies(controller: MoviesTableProtocol){
        let user: String = UserDefaults.standard.value(forKey: Constants.userDefaults.userID) as! String
        let fireMovies: String = "\(tableUsers)/\(user)/movies"
        ref = Database.database().reference()
        
        
        ref.child(fireMovies).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let array: NSArray = snapshot.children.allObjects as NSArray
            
            for child in array{
                let snap = child as! DataSnapshot
                if snap.value is NSDictionary{
                    let data: NSDictionary = snap.value as! NSDictionary
                    
                    var id: String = ""
                    var title: String = ""
                    var gender: String = ""
                    var image: String = ""
                    var score: Int = 0
                    
                    for i in data{
                        if i.key as! String == "id"{
                            id = i.value as! String
                        }
                        
                        if i.key as! String == "title"{
                            title = i.value as! String
                        }
                        
                        if i.key as! String == "gender"{
                            gender = i.value as! String
                        }
                        
                        if i.key as! String == "image"{
                            image = i.value as! String
                        }
                        
                        if i.key as! String == "score"{
                            score = i.value as! Int
                        }
                    }
                    
                    //Save in the device
                    let movie = Movie(id: id, title: title, gender: gender, picture: image, score: score)
                    let coredata: CoreDataProtocol = CoreDataManage()
                    coredata.saveMovie(movie: movie)
                    
                }
            }
            
            
            controller.moviesSaved()
        })
        
    }
    
    
}
