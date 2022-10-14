//
//  OnboardingViewController.swift
//  MeditationApp
//
//  Created by aldybuana on 11/10/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var startedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        startedButton.layer.cornerRadius = 10
        startedButton.layer.masksToBounds = true
    }
    
    @IBAction func StartedButtonTapped(_ sender: Any) {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
    
        let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let window = scene.windows.first
        window?.rootViewController = viewController
    }

}
