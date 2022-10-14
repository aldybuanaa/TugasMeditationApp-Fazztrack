//
//  HomeItemViewCell.swift
//  MeditationApp
//
//  Created by aldybuana on 12/10/22.
//

import UIKit

protocol HomeItemViewCellDelegate: NSObjectProtocol {
    func homeItemViewCellStartButtonTapped(_ cell: HomeItemViewCell)
}

class HomeItemViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var playNowButton: UIButton!
    @IBOutlet weak var ImageItem: UIImageView!
    
    weak var delegate: HomeItemViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        backgroundImageView.layer.cornerRadius = 20
        backgroundImageView.layer.masksToBounds = true
        playNowButton.layer.cornerRadius = 10
        playNowButton.layer.masksToBounds = true
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        delegate?.homeItemViewCellStartButtonTapped(self)
    }
}
