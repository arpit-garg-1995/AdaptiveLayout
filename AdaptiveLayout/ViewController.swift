//
//  ViewController.swift
//  AdaptiveLayout
//
//  Created by Arpit Garg on 03/01/21.
//  Copyright © 2021 Arpit Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var IBConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var imageSuperView: UIView!
    var landscapeConstraints = [NSLayoutConstraint]()
    @IBOutlet weak var otherView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landscapeConstraints.append(view.bottomAnchor.constraint(equalTo: imageSuperView.bottomAnchor))
        landscapeConstraints.append(imageSuperView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3))
        landscapeConstraints.append(imageSuperView.trailingAnchor.constraint(equalTo: otherView.leadingAnchor))
        landscapeConstraints.append(otherView.topAnchor.constraint(equalTo: view.topAnchor))
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            applyLandscapeConstraints()
        }else{
            portraitConstraints()
        }
    }
    
    private func portraitConstraints(){
        if let consts = IBConstraints{
            NSLayoutConstraint.deactivate(landscapeConstraints)
            view.addConstraints(consts)
        }
        
    }
    
    private func applyLandscapeConstraints(){
        if let consts = IBConstraints{
            NSLayoutConstraint.deactivate(consts)
            view.addConstraints(landscapeConstraints)
        }
    }
    
    


}

