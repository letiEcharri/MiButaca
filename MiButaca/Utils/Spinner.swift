//
//  Spinner.swift
//  MiButaca
//
//  Created by Leti on 27/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

protocol SpinnerProtocol {
    func start()
    func stop()
}

class Spinner: SpinnerProtocol{
    var superView: UIViewController
    
    init(superView: UIViewController) {
        self.superView = superView
    }
    
    func start(){
        let screenBound = superView.view.bounds
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: screenBound.width, height: screenBound.height))
        myView.backgroundColor = UIColor.black
        myView.alpha = 0.7
        myView.tag = 100
        superView.view.addSubview(myView)
        myView.spinner()
    }
    
    func stop(){
        for subview in superView.view.subviews{
            if subview.tag == 100{
                subview.removeFromSuperview()
            }
        }
    }
}

extension UIView{
    func spinner(){
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        activityIndicator.center = self.center
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
}
