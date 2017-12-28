//
//  MoviesTableViewCell.swift
//  MiButaca
//
//  Created by Leti on 18/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

protocol MoviesViewCellProtocol {
    func display(title: String)
    func display(gender: String)
    func display(image: UIImage)
    func display(score: Int)
    func save(id: String)
    func save(idFirebase: String)
}

class MoviesTableViewCell: UITableViewCell {
    
    var idMovie: String = ""
    var idFirebase: String = ""
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet var btnsStar: [UIButton]!
    
    @IBAction func starsAction(_ sender: UIButton) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MoviesTableViewCell: MoviesViewCellProtocol{
    
    func display(title: String) {
        lblTitle.text = title
    }
    
    func display(gender: String) {
        lblGender.text = gender
    }
    
    func display(image: UIImage) {
        imgPicture.image = image
    }
    
    func display(score: Int) {
        for button in btnsStar{
            if button.tag <= score{
                button.setImage(UIImage().fullStar(), for: .normal)
            }else{
                button.setImage(UIImage().emptyStar(), for: .normal)
            }
        }
    }
    
    func save(id: String){
        idMovie = id
    }
    
    func save(idFirebase: String){
        self.idFirebase = idFirebase
    }
}
