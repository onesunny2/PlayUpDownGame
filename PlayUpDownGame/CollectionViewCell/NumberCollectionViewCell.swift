//
//  NumberCollectionViewCell.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NumberCollectionViewCell"

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.frame.width / 2
        }
    }

}
