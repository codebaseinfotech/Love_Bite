//
//  SearchListTVCell.swift
//  Love Bite
//
//  Created by Ankit Gabani on 01/09/25.
//

import UIKit

class SearchListTVCell: UITableViewCell {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMember: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
