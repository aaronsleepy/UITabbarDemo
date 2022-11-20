//
//  HomeFeedCell.swift
//  UITabbarDemo
//
//  Created by Aaron on 2022/11/20.
//

import UIKit

class HomeFeedCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
