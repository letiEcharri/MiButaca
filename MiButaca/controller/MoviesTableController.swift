//
//  MoviesTableController.swift
//  MiButaca
//
//  Created by Leti on 19/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

protocol MoviesTableProtocol {
    func getMovies()
    func moviesSaved()
    func getMoviesFromDevice()->[Movie]
}

class MoviesTableController: MoviesTableProtocol {
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func getMovies(){
        let model: FirebaseDataProtocol = FirebaseData()
        model.firebaseGetMovies(controller: self)
    }
    
    func moviesSaved(){
        let myView: HomeViewController = view as! HomeViewController
        myView.goToMovies()
    }
    
    func getMoviesFromDevice()->[Movie]{
        let coredata: CoreDataProtocol = CoreDataManage()
        return coredata.fetchMovies()
    }
}
