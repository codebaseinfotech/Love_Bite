//
//  SenderChatTblViewCell.swift
//  Love Bite
//
//  Created by iMac on 01/09/25.
//

import UIKit

class SenderChatTblViewCell: UITableViewCell {

    @IBOutlet weak var viewChat: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewChat.roundCorners(corners: [.topLeft, .topRight, .bottomLeft], radius: 14)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
