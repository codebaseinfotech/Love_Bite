//
//  LoveUserListTVCell.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class LoveUserListTVCell: UITableViewCell {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewBlock: UIView!
    @IBOutlet weak var btnBlocked: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tappedBlocked(_ sender: Any) {
    }
    
}
