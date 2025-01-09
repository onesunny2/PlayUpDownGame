//
//  TryGameViewController.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import UIKit

class TryGameViewController: UIViewController {
    
    static let identifier = "TryGameViewController"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tryCountLabel: UILabel!
    @IBOutlet var numberCollectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBg

        setNavigationItem()
    }

    @objc
    func dismissFullScreen() {
        dismiss(animated: true)
    }
}

// MARK: - View UI 구성
extension TryGameViewController {
    
    func setNavigationItem() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissFullScreen))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
}
