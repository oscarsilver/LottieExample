//
//  ViewController.swift
//  LottieExample
//
//  Created by Oscar Silver on 2017-08-03.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    fileprivate lazy var favouriteAnimationView: LOTAnimationView = {
        let animationView = LOTAnimationView(name: "heartToFilled")
        animationView.isUserInteractionEnabled = false
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    fileprivate lazy var unfavouriteAnimationView: LOTAnimationView = {
        let animationView = LOTAnimationView(name: "heartToStroke")
        animationView.isUserInteractionEnabled = false
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    fileprivate lazy var favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(favoriteButtonPressed(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: Selector Methods
extension ViewController {
    func favoriteButtonPressed(_ button: UIButton) {
        button.isSelected = !button.isSelected
        
        if button.isSelected {
            playUnfavouriteAnimation()
        } else {
            playFavouriteAnimation()
        }
    }
}

// MARK: Private Methods
private extension ViewController {
    func playFavouriteAnimation() {
        unfavouriteAnimationView.isHidden = true
        favouriteAnimationView.isHidden = false
        favouriteAnimationView.stop()
        favouriteAnimationView.play()
    }
    
    func playUnfavouriteAnimation() {
        favouriteAnimationView.isHidden = true
        unfavouriteAnimationView.isHidden = false
        unfavouriteAnimationView.stop()
        unfavouriteAnimationView.play()
    }
    
    func setupViews() {
        view.addSubview(favoriteButton)
        view.addSubview(favouriteAnimationView)
        view.addSubview(unfavouriteAnimationView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 100),
            favoriteButton.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            favouriteAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favouriteAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            favouriteAnimationView.heightAnchor.constraint(equalToConstant: 100),
            favouriteAnimationView.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            unfavouriteAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            unfavouriteAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            unfavouriteAnimationView.heightAnchor.constraint(equalToConstant: 100),
            unfavouriteAnimationView.widthAnchor.constraint(equalToConstant: 100)
            ])

    }
}
