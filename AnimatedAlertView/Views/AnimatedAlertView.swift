//
//  AlertView.swift
//  AnimatedAlertView
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 13/04/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class AnimatedAlertView: UIView {
    
    var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return button
    }()
    
    var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    var alertView: UIView = {
        let alertView = UIView()
        alertView.backgroundColor = .white
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.layer.cornerRadius = 6
        alertView.clipsToBounds = true
        return alertView
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "") // TODO: Placeholder
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    convenience init(title: String, message: String, buttonTitle: String) {
        self.init(frame: UIScreen.main.bounds)
        setupAlertLayout(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup methods
    
    func setupAlertLayout(title: String, message: String, buttonTitle: String) {
        backgroundView.frame = frame
        addSubview(backgroundView)
//        titleLabel.text = title
//        subtitleLabel.text = message
//        dismissButton.setTitle(buttonTitle, for: .normal)
//        logoImageView.frame.size = CGSize(width: 74, height: 48)
//        dismissButton.frame.size = CGSize(width: 256, height: 48)
//        titleLabel.frame.size = CGSize(width: 258, height: 36)
//        subtitleLabel.frame.size = CGSize(width: 258, height: 72)
//        alertView.addSubview(logoImageView)
//        let dialogViewHeight = logoImageView.frame.height + titleLabel.frame.height + subtitleLabel.frame.height + dismissButton.frame.height + 80
        alertView.center.x = self.center.x - (frame.width / 2) + 32
        alertView.frame.size = CGSize(width: 272, height: 480)
//        let logoImageViewXOrigin = (alertView.frame.size.width / 2) - 37
//        logoImageView.frame.origin = CGPoint(x: logoImageViewXOrigin, y: 24)
//        dismissButton.addTarget(self, action: #selector(dismissAlertView), for: .touchUpInside)
//        alertView.addSubview(dismissButton)
//        alertView.addSubview(titleLabel)
//        alertView.addSubview(subtitleLabel)
//        let confirmButtonXOrigin = (alertView.frame.size.width / 2) - 128
//        dismissButton.frame.origin = CGPoint(x: confirmButtonXOrigin, y: alertView.frame.size.height - 72)
//        let titleLabelXOrigin = (alertView.frame.size.width / 2) - 128
//        titleLabel.frame.origin = CGPoint(x: titleLabelXOrigin, y: 96)
//        let subtitleLabelXOrigin = (alertView.frame.size.width / 2) - 128
//        subtitleLabel.frame.origin = CGPoint(x: subtitleLabelXOrigin, y: 116)
        addSubview(alertView)
    }
    
    // MARK: - Action methods
    
    func showAlertView() {
        self.backgroundView.alpha = 0
        if var rootController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = rootController.presentedViewController {
                rootController = presentedViewController
            }
            rootController.view.addSubview(self)
        } else if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, var rootController = sceneDelegate.window?.rootViewController {
            while let presentedViewController = rootController.presentedViewController {
                rootController = presentedViewController
            }
            rootController.view.addSubview(self)
        }
        UIView.animate(withDuration: 0.33, animations: {
            self.backgroundView.alpha = 0.66
        })
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIView.AnimationOptions(rawValue: 0), animations: {
            self.alertView.center.y = self.center.y
        })
    }
    
    @objc func dismissAlertView() {
        UIView.animate(withDuration: 0.33, animations: {
            self.backgroundView.alpha = 0
        })
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIView.AnimationOptions(rawValue: 0), animations: {
            self.alertView.center = CGPoint(x: self.center.x, y: self.frame.height + self.alertView.frame.height / 2)
        }, completion: { (completed) in
            self.removeFromSuperview()
        })
    }
}

