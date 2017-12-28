//
//  ItunesService.swift
//  MiButaca
//
//  Created by Leti on 20/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit
import Alamofire

protocol ItunesServiceProtocol {
    func getMoviesFromItunes(movie: String, controller: BaseController)
}

class ItunesService: ItunesServiceProtocol {
    
    let constants = Constants.itunes.self
    
    func getMoviesFromItunes(movie: String, controller: BaseController){
        var movies: [Movie] = [Movie]()
        let url = "\(constants.baseURL)\(constants.entityMovieParam)&term=\(movie.cleanSpaces())"
        
        Alamofire.request(url).responseJSON { response in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? NSDictionary{
                
                //getting the result tag array from json and converting it to NSArray
                if let movieArray = jsonObj?.value(forKey: "results") as? NSArray{
                    //looping through all the elements
                    for film in movieArray{
                        //converting the element to a dictionary
                        if let movieDict = film as? NSDictionary{
                            if movieDict.value(forKey: "wrapperType") as! String == "track"{
                                let id: Int = movieDict.value(forKey: "trackId") as! Int
                                let name: String = movieDict.value(forKey: "trackName") as! String
                                var genre: String = "Desconocido"
                                if movieDict.value(forKey: "primaryGenreName") != nil{
                                    genre = movieDict.value(forKey: "primaryGenreName") as! String
                                }
                                let image: String = movieDict.value(forKey: "artworkUrl100") as! String
                                
                                let preDate: String = movieDict.value(forKey: "releaseDate") as! String
                                let date1 = preDate.split(separator: "T")
                                let date2: String = String(date1[0])
                                let date: Date = date2.stringToDate()
                                
                                let country: String = movieDict.value(forKey: "country") as! String
                                let resume: String = movieDict.value(forKey: "longDescription") as! String
                                
                                
                                
                                //Add movie
                                let item = Movie(id: String(id), idFirebase: "", title: name, gender: genre, picture: image, score: 0, date: date, country: country, resume: resume)
                                
                                movies.append(item)
                            }
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    controller.serviceResponse(reponse: movies as AnyObject)
                })
                
                
            }
            
        }
    }
}


