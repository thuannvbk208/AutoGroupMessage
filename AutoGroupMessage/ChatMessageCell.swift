//
//  ChatMessageCell.swift
//  AutoGroupMessage
//
//  Created by Thuannv on 6/26/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let normalFont = UIFont(name: "Helvetica", size: 12.0)!
    let boldFont = UIFont(name: "Helvetica-Bold", size: 12.0)!
    let maxWidthContent: CGFloat = 250.0
    
    @IBOutlet weak var avartaView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bubleView: UIView!
    @IBOutlet weak var widthLayoutConstraint: NSLayoutConstraint!
    
    func configureViews(name: String, title: String) {
        nameLabel.text = name
        messageLabel.text = title
        messageLabel.numberOfLines = 0
        let widthNameLabel = name.widthOfString(usingFont: boldFont)
        let widthMessageLable = title.widthOfString(usingFont: normalFont)
        let t = widthNameLabel < widthMessageLable ? widthMessageLable : widthNameLabel
        let width = t > maxWidthContent ? maxWidthContent : t
        widthLayoutConstraint.constant = width + 5.0
    }
}
