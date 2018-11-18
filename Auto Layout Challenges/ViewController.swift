//
//  ViewController.swift
//  Auto Layout Challenges
//
//  Created by Ramon Geronimo on 11/17/18.
//  Copyright © 2018 Ramon Geronimo. All rights reserved.
//

import UIKit

extension UIColor {
    static var fadingRed = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

class ViewController: UIViewController {
    
    // Create logo imageview
    // {} is a closure or anonimus func
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
        let attributedText = NSMutableAttributedString(string: "Baseball reaction and focus tournament", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nTest your reaction time and focus to genereate stats and win the CHAMPIONSHIP. Do you have what it takes to play like a pro? " , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
        
        
//        textView.text = "Join us today in our fun and game!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    // Add Prev button
    private let previeousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        // Enable autolayout
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    // Add Next button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        // Enable autolayout
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    // Page pagination control -- Default color is white
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .fadingRed
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add description subview
        view.addSubview(descriptionTextView)
        setupBottomControls()
        // Add setup layouts
        setupLayout()
        
    }
    
    //Set up the bottom Control
    fileprivate func setupBottomControls() {
        view.addSubview(previeousButton)

        //Setup a Stackview
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previeousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        
        // Another way to set constraint -- Previews button constraint
        NSLayoutConstraint.activate([
            bottomControlsStackView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)])
    }

    private func setupLayout() {
        // Create a top subview
        let topImageContainerView = UIView()

        // Add topview subview
        view.addSubview(topImageContainerView)

        //Enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        // Add top subview constraint top
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        // Add top subview constraint height
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
  
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        // Add the logo inside the top subview
        topImageContainerView.addSubview(baseball)
        // Add the logo constraint to the top subview
        baseball.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        baseball.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        baseball.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        // Add the description constraint to the bottom of the top subview
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        // Add the description constraint left, right and bottom
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    
}

