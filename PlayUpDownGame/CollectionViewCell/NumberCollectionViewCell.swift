//
//  NumberCollectionViewCell.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NumberCollectionViewCell"

    @IBOutlet var numberButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    
    func configCell(num: String) {
        numberButton.backgroundColor = .white
        numberButton.setTitle(num, for: .normal)
        numberButton.tintColor = .black
        
        DispatchQueue.main.async {
            self.numberButton.layer.cornerRadius = self.numberButton.frame.width / 2
        }
    }
    
    func selectToggle() {
        print(#function)
        numberButton.backgroundColor = .black
        numberButton.tintColor = .white
    }
    
    func deselectToggle() {
        
        numberButton.backgroundColor = .white
        numberButton.tintColor = .black
    }

}
