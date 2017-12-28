//
//  DescriptionController.swift
//  MiButaca
//
//  Created by Leti on 28/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

protocol DescriptionProtocol {
    func getScore(idMovie: String) -> Int
}

class DescriptionController: DescriptionProtocol {
    var view: DescriptionViewController
    
    init(view: DescriptionViewController) {
        self.view = view
    }
    
    func getScore(idMovie: String) -> Int{
        let coredata: CoreDataProtocol = CoreDataManage()
        let movie: Movie = coredata.fetchOneMovie(id: idMovie)
        return movie.score
    }
}

extension DescriptionController: BaseController{
    func serviceResponse(reponse: AnyObject) {
        let movies: [Movie] = reponse as! [Movie]
        let movie: Movie = movies[0]
        
        view.lblTitle.text = movie.title
        view.lblDate.text = movie.date.toString()
        view.lblCountry.text = movie.country
        view.lblGender.text = movie.gender
        view.txvResume.text = movie.resume
        view.imgImage.image = movie.picture.loadImageFromURL()
        
        view.idMovie = movie.id
        view.idFirebase = movie.idFirebase
        //view.score = getScore(idMovie: movie.id)
    }
    
}
