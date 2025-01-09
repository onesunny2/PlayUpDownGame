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
    
    let updownGame = UpdownGame(setNum: 0, countNum: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBg
        
        print(updownGame.countNum, updownGame.setNum)

        setNavigationItem()
        configTitles()
        configButton()
        
//        numberCollectionView.delegate = self
//        numberCollectionView.dataSource = self
    }

    @objc
    func dismissFullScreen() {
        dismiss(animated: true)
    }
}

// MARK: - CollectionView 설정
//extension TryGameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    // updownGame내부에 프로퍼티 만들어서 거기에다가 앞에서 입력한 숫자 받도록하기
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        <#code#>
////    }
////    
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        <#code#>
////    }
//}

// MARK: - View UI 구성
extension TryGameViewController {
    
    func setNavigationItem() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissFullScreen))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func configTitles() {
        titleLabel.commonDesign(UpdownGame.gamename, bool: false)
        
        let countText = "시도 횟수: \(updownGame.countNum)"
        tryCountLabel.commonDesign(countText)
    }
    
    func configButton() {
        resultButton.defaultButtonUI("결과 확인하기", updownGame.isSelected ? .black : .lightGray, bool: updownGame.isSelected ? true : false)
    }
}
