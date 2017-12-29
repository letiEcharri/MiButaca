//
//  Movie.swift
//  MiButaca
//
//  Created by Leti on 18/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

struct Movie {
    
    let id: String
    let idFirebase: String
    let title: String
    let gender: String
    let picture: String
    let score: Int
    
    var date: Date = Date()
    var country: String = ""
    var resume: String = ""
    var trailer: String = ""
    
    //Movies list
    init(id: String, idFirebase: String, title: String, gender: String, picture: String, score: Int) {
        self.id = id
        self.idFirebase = idFirebase
        self.title = title
        self.gender = gender
        self.picture = picture
        self.score = score
    }
    
    //Movie Description
    init(id: String, idFirebase: String, title: String, gender: String, picture: String, score: Int, date: Date, country: String, resume: String, trailer: String) {
        self.id = id
        self.idFirebase = idFirebase
        self.title = title
        self.gender = gender
        self.picture = picture
        self.score = score
        self.date = date
        self.country = country
        self.resume = resume
        self.trailer = trailer
    }
}
