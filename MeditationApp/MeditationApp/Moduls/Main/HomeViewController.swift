//
//  HomeViewController.swift
//  MeditationApp
//
//  Created by aldybuana on 12/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    weak var moodListCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mood", for: indexPath) as! MoodViewCell
//            let item = indexPath.item
//            cell.imageView.image = item == 0 ? UIImage(named: "Calm") : UIImage(named: "Relax")
//            cell.titleLabel.text = "Calm"
            
            
//        }
//
        let item = indexPath.item
        if item == 0 {
            cell.imageView.image = UIImage(named: "Calm")
            cell.titleLabel.text = "Calm"
        }
        else if item == 1{
            cell.imageView.image = UIImage(named: "Relax")
            cell.titleLabel.text = "Relax"
        }
        else if item == 2{
            cell.imageView.image = UIImage(named: "Focus")
            cell.titleLabel.text = "Focus"
        }
        else if item == 3{
            cell.imageView.image = UIImage(named: "Anxious")
            cell.titleLabel.text = "Anxious"
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! HomeItemViewCell
            
            let item = indexPath.item
            cell.backgroundImageView.backgroundColor = UIColor(rgb: 0xF7F3F0)
            cell.ImageItem.image = item == 5 ? UIImage(named: "ImageItem2") : UIImage(named: "ImageItem1")
            cell.titleLabel.text = item == 5  ? "Cardio Meditation" : "Meditation 101"
            cell.subtitleLabel.text = item == 5 ? "Basics of Yoga for Beginners or Experienced Professionals" : "Techniques, Benefits, and a Beginner’s How-To"

            cell.delegate = self
            
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        let titleLabel = view.viewWithTag(100) as! UILabel
        let subtitleLabel = view.viewWithTag(101) as! UILabel
        
        
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.text = "Welcome back, Aldy!"
        subtitleLabel.isHidden = false
        subtitleLabel.text = "How are you feeling today ?"
        
        
        return view
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView == self.collectionView {
//            if section == 0 {
                return UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
//            }
//            else {
//                return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
//            }
//        }
//        else {
//            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == self.recomendedListCollectionView {
//            return CGSize(width: 163, height: 161)
//        }
//        else {
//            if indexPath.section != 0 {
//                let screenWidth = UIScreen.main.bounds.width
//                return CGSize(width: screenWidth, height: 161)
//            }
//            else {
//                if indexPath.item == 2 {
//                    let leftInset: CGFloat = 20.0
//                    let rightInset: CGFloat = 20.0
//
//                    let screenWidth = UIScreen.main.bounds.width
//                    let width = screenWidth - (leftInset + rightInset)
//                    let height = 88.0
//                    return CGSize(width: width, height: height)
//                }
//                else {
        if indexPath.item > 3 {
            let leftInset: CGFloat = 30.0
            let rightInset: CGFloat = 30.0
            
            let screenWidth = UIScreen.main.bounds.width
            let width = screenWidth - (leftInset + rightInset)
            let height = 169.0
            return CGSize(width: width, height: height)
        }
        else {
            let screenWidth = UIScreen.main.bounds.width
            let width = (screenWidth - (20 + 20 + 20 + 20 + 20)) / 4
            let height = 85 / 62 * width
        
            return CGSize(width: width, height: height)
        }
//                }
//            }
        }
//    }
}

// MARK: - HomeItem1ViewCellDelegate
extension HomeViewController: HomeItemViewCellDelegate {
    func homeItemViewCellStartButtonTapped(_ cell: HomeItemViewCell) {
        
        presentPlayerViewController()
//        showPlayerViewController()
    }
}
