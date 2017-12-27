//
//  Constants.swift
//  MiButaca
//
//  Created by Leti on 18/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import Foundation

struct Constants {
    
    static let appName = "MI BUTACA"
    static let moviesName = "PELÍCULAS"
    static let buscarPeli = "BUSCAR"
    
    struct segue {
        static let LoginToHome = "segueLoginToHome"
        static let HomeToMovies = "segueHomeToMovies"
        static let MoviesToSearch = "segueMoviesToSearch"
    }
    
    struct userDefaults {
        static let user = "user"
        static let userID = "userID"
    }
    
    struct databases {
        static let email = "email"
        static let id = "id"
        static let movies = "movies"
        static let title = "title"
        static let gender = "gender"
        static let image = "image"
        static let score = "score"
        static let nick = "nick"
        static let password = "password"
    }
    
    struct coredataEntities {
        static let movies = "MovieDC"
    }
    
    struct itunes {
        static let baseURL = "https://itunes.apple.com/search?"
        static let entityMovieParam = "entity=movie"
    }
    
    struct cellsNames {
        static let movieCell = "movieTableCell"
        static let movieSearchCell = "movieSearchTableCell"
    }
}
