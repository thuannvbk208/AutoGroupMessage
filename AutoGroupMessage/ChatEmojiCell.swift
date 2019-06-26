//
//  ChatEmojiCell.swift
//  AutoGroupMessage
//
//  Created by Thuannv on 6/26/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import UIKit

class ChatEmojiCell: UITableViewCell {
    let boldFont = UIFont(name: "Helvetica-Bold", size: 12.0)!
    let maxWidthContent: CGFloat = 150.0
    @IBOutlet weak var avartaView: UIImageView!
    @IBOutlet weak var emojiView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bubleView: UIView!
    @IBOutlet weak var widthLayoutConstraint: NSLayoutConstraint!
    
    func configureViews(name: String, image: String) {
        nameLabel.text = name
        //nameLabel.numberOfLines = 0
        let widthNameLabel = name.widthOfString(usingFont: boldFont)
        let width = widthNameLabel > maxWidthContent ? maxWidthContent : widthNameLabel
        widthLayoutConstraint.constant = width + 5.0
        emojiView.image = UIImage(named: image)
    }
}
