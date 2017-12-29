//
//  DescriptionViewController.swift
//  MiButaca
//
//  Created by Leti on 27/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var txvResume: UITextView!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    @IBOutlet weak var btnTrailer: UIButton!
    
    @IBOutlet var btnStars: [UIButton]!
    
    var idMovie: String = ""
    var idFirebase: String = ""
    var score: Int = 0
    var trailer: String = ""
    var showStars: Bool = true
    var imageString: String = ""
    
    var moviesView: MoviesTableViewController = MoviesTableViewController()
    
    
    override func viewWillAppear(_ animated: Bool) {
        let controller: DescriptionProtocol = DescriptionController(view: self)
        controller.getMovieData(movieID: idMovie)
        if showStars{
            score = controller.getScore(idMovie: idMovie)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showEverything()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        displayScore()
        if trailer == ""{
            btnTrailer.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isMovingFromParentViewController && showStars{
            moviesView.tableView.reloadData()
        }
    }

    @IBAction func starsAction(_ sender: UIButton) {
        score = sender.tag
        displayScore()
        
        let controller: DescriptionProtocol = DescriptionController(view: self)
        controller.update(score: sender.tag)
    }
    
    @IBAction func trailerAction(_ sender: UIButton) {
        goToTrailer()
    }
    
    
    func displayScore(){
        if showStars{
            for button in btnStars{
                if button.tag <= score{
                    button.setImage(UIImage().fullStar(), for: .normal)
                }else{
                    button.setImage(UIImage().emptyStar(), for: .normal)
                }
            }
        }
    }
    
    func showEverything(){
        imgImage.isHidden = false
        lblTitle.isHidden = false
        lblDate.isHidden = false
        lblCountry.isHidden = false
        txvResume.isHidden = false
        lblGender.isHidden = false
        btnTrailer.isHidden = false
        
        if showStars{
            for button in btnStars{
                button.isHidden = false
            }
        }else{
            btnFavorite.isHidden = false
        }
    }
    
    func goToTrailer(){
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: Constants.segue.DescriptionToTrailer, sender: nil)
        }
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        sender.alpha = 0.3
        let movie = Movie(id: idMovie, idFirebase: "", title: lblTitle.text!, gender: lblGender.text!, picture: imageString, score: 0)
        
        let controller: DescriptionProtocol = DescriptionController(view: self)
        controller.saveData(movie: movie)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            sender.alpha = 1
        }
    }
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.segue.DescriptionToTrailer{
            let view: TrailerViewController = segue.destination as! TrailerViewController
            
            view.urlVideo = trailer
        }
    }


}
