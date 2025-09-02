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
        
        viewChat.clipsToBounds = true
        viewChat.layer.cornerRadius = 16
        viewChat.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
