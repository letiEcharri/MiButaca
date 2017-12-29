//
//  SearchMovieController.swift
//  MiButaca
//
//  Created by Leti on 21/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import Foundation

protocol SearchMovieProtocol {
    func search(movie: String)
}

class SearchMovieController: SearchMovieProtocol {
    
    let view: SearchMovieTableViewController
    
    init(view: SearchMovieTableViewController) {
        self.view = view
    }
    
    func search(movie: String){
        let itunes: ItunesServiceProtocol = ItunesService()
        itunes.getMoviesFromItunes(movie: movie, controller: self)
    }
}

extension SearchMovieController: BaseController{
    func serviceResponse(response: AnyObject) {
        let movies: [Movie] = response as! [Movie]
        view.reloadData(movies: movies)
    }
}
