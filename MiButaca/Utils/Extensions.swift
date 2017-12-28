//
//  Extensions.swift
//  MiButaca
//
//  Created by Leticia on 7/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

extension UIColor{
    
    func customYellow() -> UIColor{
        return UIColor(red: 255, green: 241, blue: 121, alpha: 1)
    }
    
    func blackTransparent() -> UIColor{
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
}

extension UITextField{
    
    func addImageLeft(image: UIImage, width: Int, height: Int) {
        self.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.leftView = imageView
    }
}

extension String{
    
    func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: self) != nil
    }
    
    func loadImageFromURL() -> UIImage{
        var myImage: UIImage = UIImage(named: "noImage.jpg")!
        
        if self != ""{
            let url = URL(string: self)
            let data = try? Data(contentsOf: url!)
            myImage = UIImage(data: data!)!
        }
        
        return myImage
    }
    
    func cleanSpaces() -> String{
        return self.replacingOccurrences(of: " ", with: "+")
    }
    
    func stringToDate() -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = formatter.date(from: self)
        
        return date!
    }
}

extension UIImage{
    func fullStar() -> UIImage{
        return UIImage(named: "star.jpeg")!
    }
    
    func emptyStar() -> UIImage{
        return UIImage(named: "emptyStar.jpg")!
    }
}

extension Date{
    func toString() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        let newDate = formatter.string(from: self)
        
        return newDate
    }
}
