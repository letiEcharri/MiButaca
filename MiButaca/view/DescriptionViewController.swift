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
    
    @IBOutlet weak var btnTrailer: UIButton!
    
    @IBOutlet var btnStars: [UIButton]!
    
    var idMovie: String = ""
    var idFirebase: String = ""
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayScore()
    }

    @IBAction func starsAction(_ sender: UIButton) {
    }
    
    func displayScore(){
        for button in btnStars{
            if button.tag <= score{
                button.setImage(UIImage().fullStar(), for: .normal)
            }else{
                button.setImage(UIImage().emptyStar(), for: .normal)
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
