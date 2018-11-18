//
//  PageCell.swift
//  Auto Layout Challenges
//
//  Created by Ramon Geronimo on 11/17/18.
//  Copyright © 2018 Ramon Geronimo. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            baseball.image = UIImage(named: page.imageName)
            
            let attributedText = NSMutableAttributedString(string: page.headerText, attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(page.bodyText)" , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    // Create team imageview
    let baseball: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "baseball"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Create description textview
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        // Add attributes text
        let attributedText = NSMutableAttributedString(string: "Simple click play and win", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nTest your reaction time and focus to genereate stats and win the CHAMPIONSHIP. Do you have what it takes to play like a pro? " , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        // Create a top subview
        let topImageContainerView = UIView()
        
        // Add topview subview
        addSubview(topImageContainerView)
        
        //Enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        // Add top subview constraint top
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        // Add top subview constraint height
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        // Add the logo inside the top subview
        topImageContainerView.addSubview(baseball)
        // Add the logo constraint to the top subview
        baseball.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        baseball.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        baseball.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
//         Add the description constraint to the bottom of the top subview
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        // Add the description constraint left, right and bottom
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
