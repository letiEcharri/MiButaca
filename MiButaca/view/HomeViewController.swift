//
//  HomeViewController.swift
//  MiButaca
//
//  Created by Leti on 18/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = UIColor.black
        self.title = Constants.appName
    }

    @IBAction func logout(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(nil, forKey: Constants.userDefaults.user)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func moviesAction(_ sender: CustomHomeButton) {
        let spinner: SpinnerProtocol = Spinner(superView: self)
        spinner.start()
        
        let coredata: CoreDataProtocol = CoreDataManage()
        coredata.deleteAllRecords(entity: Constants.coredataEntities.movies)
        
        let controller: HomeProtocol = HomeController(view: self)
        controller.getMovies()
    }
    
    
    @IBAction func seriesAction(_ sender: CustomHomeButton) {
    }
    
    func goToMovies(){
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: Constants.segue.HomeToMovies, sender: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.segue.HomeToMovies{
            let spinner: SpinnerProtocol = Spinner(superView: self)
            spinner.stop()
        }
    }

}

class CustomHomeButton: UIButton{
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor().blackTransparent()
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }
}
