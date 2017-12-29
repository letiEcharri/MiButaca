//
//  MoviesTableController.swift
//  MiButaca
//
//  Created by Leti on 19/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

protocol MoviesTableProtocol {
    func getMoviesFromDevice()->[Movie]
    func update(score: Int, firebaseID: String)
    func getMovieDescription(movieID: String, controller: DescriptionController)
}

class MoviesTableController: MoviesTableProtocol {
    var view: MoviesTableViewController
    
    init(view: MoviesTableViewController) {
        self.view = view
    }
    
    func getMoviesFromDevice()->[Movie]{
        let coredata: CoreDataProtocol = CoreDataManage()
        return coredata.fetchMovies()
    }
    
    func update(score: Int, firebaseID: String){
        let model: FirebaseDataProtocol = FirebaseData()
        model.updateScore(controller: self, firebaseID: firebaseID, score: score)
    }
    
    func getMovieDescription(movieID: String, controller: DescriptionController){
        let itunes: ItunesServiceProtocol = ItunesService()
        itunes.getMoviesFromItunes(movie: movieID, controller: controller)
    }
}

extension MoviesTableController: BaseController{
    func serviceResponse(response: AnyObject) {
        view.movies = getMoviesFromDevice()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.view.reloadData()
        }
        
        
    }
}


