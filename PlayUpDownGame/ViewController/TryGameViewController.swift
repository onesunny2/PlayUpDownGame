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
    
    let updownGame = UpdownGame(setNum: 0, countNum: 0, selectedNum: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBg
        
        updownGame.randomNum = Int.random(in: 1...updownGame.setNum)
        
        let array = Array(1...updownGame.setNum)
        updownGame.entireNumList = array.map { String($0) }
        updownGame.cellList = updownGame.entireNumList
        
        print(updownGame.setNum, updownGame.randomNum)
        print(updownGame.entireNumList, updownGame.cellList)
        
        setNavigationItem()
        configTitles()
        configButton()
        
        configCollectionView()
        numberCollectionView.collectionViewLayout = configCollectionViewLayout()
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        updownGame.checkAnswer(selected: updownGame.selectedNum, titleLabel)
        
        numberCollectionView.reloadData()
    }
    
    @objc
    func dismissFullScreen() {
        dismiss(animated: true)
    }
}



// MARK: - collectionView 초기 등록 설정
extension TryGameViewController {
    
    func configCollectionViewLayout() -> UICollectionViewFlowLayout {
        
        let sectionInsect: CGFloat = 12
        let itemSpacing: CGFloat = 8
        let cellHeight = (numberCollectionView.frame.height - (sectionInsect * 2 + itemSpacing * 4)) / 5
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionInsect, bottom: 0, right: sectionInsect)
        layout.itemSize = CGSize(width: cellHeight, height: cellHeight)
        
        return layout
    }
    
    func configCollectionView() {
        
        numberCollectionView.backgroundColor = .clear
        numberCollectionView.isPagingEnabled = true
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
        
        let xib = UINib(nibName: NumberCollectionViewCell.identifier, bundle: nil)
        numberCollectionView.register(xib, forCellWithReuseIdentifier: NumberCollectionViewCell.identifier)
    }
}

 // MARK: - CollectionView 필수 설정
extension TryGameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
     // updownGame내부에 프로퍼티 만들어서 거기에다가 앞에서 입력한 숫자 받도록하기
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return updownGame.cellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCollectionViewCell.identifier, for: indexPath) as? NumberCollectionViewCell else { return UICollectionViewCell() }
        
        let num = updownGame.cellList[indexPath.item]
        
            cell.configCell(num: num)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function, indexPath.item)
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? NumberCollectionViewCell else { return }
        
        cell.selectToggle()
        
        updownGame.countNum += 1
        if let intNum = Int(updownGame.cellList[indexPath.row]) {
            updownGame.selectedNum = intNum
        }
        
        let countText = "시도 횟수: \(updownGame.countNum)"
        tryCountLabel.commonDesign(countText)
        
        resultButton.isEnabled = true
        updownGame.isSelected = true
        resultButton.defaultButtonUI("결과 확인하기", updownGame.isSelected ? .black : .lightGray)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? NumberCollectionViewCell else { return }
        
        cell.deselectToggle()
    }

}

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
        resultButton.defaultButtonUI("결과 확인하기", updownGame.isSelected ? .black : .lightGray)
        resultButton.isEnabled = false
    }
}
