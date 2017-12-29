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
    func update(score: Int)
    func getMovieData(movieID: String)
    func saveData(movie: Movie)
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
    
    func update(score: Int){
        let firebase: FirebaseDataProtocol = FirebaseData()
        firebase.updateScore(controller: self, firebaseID: view.idFirebase, score: score)
        
        let coredata: CoreDataProtocol = CoreDataManage()
        coredata.updateMovie(key: Constants.databases.score, value: score, idMovie: view.idMovie)
    }
    
    func getMovieData(movieID: String){
        let itunes: ItunesServiceProtocol = ItunesService()
        itunes.getMoviesFromItunes(movie: movieID, controller: self)
    }
    
    func saveData(movie: Movie){
        let coredata: CoreDataProtocol = CoreDataManage()
        coredata.saveMovie(movie: movie)
        
        let firebase: FirebaseDataProtocol = FirebaseData()
        firebase.save(movie: movie)
    }
}

extension DescriptionController: BaseController{
    func serviceResponse(response: AnyObject) {
        if response is [Movie]{
            let movies: [Movie] = response as! [Movie]
            let movie: Movie = movies[0]
            
            view.lblTitle.text = movie.title
            view.lblDate.text = movie.date.toString()
            view.lblCountry.text = movie.country
            view.lblGender.text = movie.gender
            view.txvResume.text = movie.resume
            view.imgImage.image = movie.picture.loadImageFromURL()
            
            view.idMovie = movie.id
            //view.idFirebase = movie.idFirebase
            view.score = getScore(idMovie: movie.id)
            view.trailer = movie.trailer
        }
    }
    
}
