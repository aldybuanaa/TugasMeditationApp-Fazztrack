//
//  MainViewController.swift
//  MeditationApp
//
//  Created by aldybuana on 12/10/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    
    
    func setup() {
        let isLight = self.traitCollection.userInterfaceStyle == .light
        tabBar.tintColor = isLight ? UIColor.white : UIColor.white
        tabBar.unselectedItemTintColor = isLight ? UIColor(rgb: 0xA0A3B1) : UIColor.white
    }
}
