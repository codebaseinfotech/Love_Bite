//
//  ReceiverChatTblViewCell.swift
//  Love Bite
//
//  Created by iMac on 01/09/25.
//

import UIKit

class ReceiverChatTblViewCell: UITableViewCell {

    @IBOutlet weak var viewReceiverChat: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewReceiverChat.clipsToBounds = true
        viewReceiverChat.layer.cornerRadius = 16
        viewReceiverChat.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
