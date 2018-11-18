//
//  SwipingController.swift
//  Auto Layout Challenges
//
//  Created by Ramon Geronimo on 11/17/18.
//  Copyright © 2018 Ramon Geronimo. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // Add Prev button
    private let previeousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        // Enable autolayout
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    @objc private func handlePrev() {
        let prevIndex = pageControl.currentPage > 0 ? pageControl.currentPage - 1 : 0
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        print("Trying to advance to next")
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // Add Next button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        // Enable autolayout
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = pageControl.currentPage < pages.count - 1 ? pageControl.currentPage + 1 : pages.count - 1
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        print("Trying to advance to next")
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    // Page pagination control -- Default color is white
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .fadingRed
        return pc
    }()

    
    let pages = [
        Page(imageName: "baseball", headerText: "Baseball reaction tournament", bodyText: "97 is a hit, 98 is a double, 99 is a triple, 100 is a homerun, everything else is an out."),
        Page(imageName: "football", headerText: "Football tapping tournament", bodyText: "Tackle and protect the runningback by tapping the defensive players"),
        Page(imageName: "soccer", headerText: "Soccer awareness tournament", bodyText: "Preventing the opposing team from scoring by intercepting shots at goal."),
        Page(imageName: "basketball", headerText: "Basketball agility tournament", bodyText: "Dribble and Alley-Oop before the 5 second rule that starts when not passing the ball within that time")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
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
    
    // Page Control current page when dragging
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
}
