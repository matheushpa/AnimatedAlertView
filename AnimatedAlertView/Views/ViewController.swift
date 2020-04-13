//
//  ViewController.swift
//  AnimatedAlertView
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 13/04/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let alertView = AnimatedAlertView(title: kAlertTitleExample, message: kAlertSubtitleExample, buttonTitle: kAlertButtonTitleExample)
    
    var tryMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(kMainButtonTitleExample, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: - Setup methods
    
    func setupLayout() {
        view.backgroundColor = .red
        view.addSubview(tryMeButton)
        tryMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tryMeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tryMeButton.widthAnchor.constraint(equalToConstant: 272).isActive = true
        tryMeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        tryMeButton.addTarget(self, action: #selector(showAnimatedAlert), for: .touchUpInside)
    }
    
    // MARK: - Action methods
    
    @objc func showAnimatedAlert() {
        self.alertView.showAlertView()
    }
}

