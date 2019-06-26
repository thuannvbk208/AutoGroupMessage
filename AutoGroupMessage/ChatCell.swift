//
//  ChatCell.swift
//  AutoGroupMessage
//
//  Created by Thuannv on 6/25/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//
import UIKit

class ChatCell: UITableViewCell {
    var bubbleView = UIView()
    var avartaView = UIView()
    var nameLabel = UILabel()
    var messageLabel = UILabel()
    
    var widthLayoutConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(title: String, message: String) {
        bubbleView.backgroundColor = .green
        bubbleView.layer.cornerRadius = 16.0
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bubbleView)
        
        avartaView.backgroundColor = .green
        avartaView.layer.cornerRadius = 16.0
        avartaView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(avartaView)
        avartaView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        avartaView.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        avartaView.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        avartaView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        let font = UIFont(name:"Helvetica-Bold", size: 12.0)
        let msgFont = UIFont(name:"Helvetica", size: 12.0)
        let widthNameLabel = title.widthOfString(usingFont: font!)
        let widthMessageLabel = message.widthOfString(usingFont: msgFont!)
        let temp = widthNameLabel < widthMessageLabel ? widthMessageLabel : widthNameLabel
        let widthContant = (temp + 5.0) < 200.0 ? (temp + 5.0) : 200.0
        
        
        nameLabel.text = title
        nameLabel.font = font
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 57.0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: (widthNameLabel + 5.0)).isActive = true
        
        messageLabel.text = message
        messageLabel.font = msgFont
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.0).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 57.0).isActive = true
        widthLayoutConstraint = messageLabel.widthAnchor.constraint(equalToConstant: widthContant)
        widthLayoutConstraint.isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0).isActive = true
        
        bubbleView.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -10.0).isActive = true
        bubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47.0).isActive = true
        bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 10.0).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10.0).isActive = true
    }
    
}

extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

