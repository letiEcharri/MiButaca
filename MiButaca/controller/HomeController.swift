//
//  HomeController.swift
//  MiButaca
//
//  Created by Leti on 27/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

protocol HomeProtocol {
    func getMovies()
}

class HomeController: HomeProtocol {
    var view: HomeViewController
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func getMovies(){
        let model: FirebaseDataProtocol = FirebaseData()
        model.firebaseGetMovies(controller: self)
    }
}

extension HomeController: BaseController{
    func serviceResponse(response: AnyObject) {
        view.goToMovies()
    }
}
