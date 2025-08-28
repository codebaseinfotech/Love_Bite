//
//  PostListTVCell.swift
//  Love Bite
//
//  Created by Ankit Gabani on 26/08/25.
//

import UIKit

class PostListTVCell: UITableViewCell {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var imgLike: UIImageView!
    @IBOutlet weak var lblCountLike: UILabel!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    var tappedMore: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tappedLike(_ sender: Any) {
    }
    @IBAction func tappedMore(_ sender: Any) {
        tappedMore?()
    }
    
}
