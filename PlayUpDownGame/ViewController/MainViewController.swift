//
//  MainViewController.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var gameTitle: [UILabel]!
    @IBOutlet var gameImageView: UIImageView!
    @IBOutlet var underLineImageView: UIImageView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var numberTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBg

        mainTitle()
        mainImage()
        textfield()
        numberLine()
        startingButton()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: TryGameViewController.identifier) as? TryGameViewController else { return }
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
    
    @IBAction func viewTapGuesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

// MARK: - View UI 작업 관련
extension MainViewController {
    
    func mainTitle() {
        gameTitle[0].commonDesign("UP DOWN", bool: false)
        gameTitle[1].commonDesign("GAME", color: .darkGray, size: 20)
    }
    
    func mainImage() {
        gameImageView.image = UIImage(named: "emotion3")
        gameImageView.contentMode = .scaleAspectFill
    }
    
    func textfield() {
        numberTextfield.borderStyle = .none
        numberTextfield.keyboardType = .numberPad
        numberTextfield.textAlignment = .center
        numberTextfield.font = .systemFont(ofSize: 30, weight: .bold)
        numberTextfield.attributedPlaceholder = NSAttributedString(string: "랜덤 숫자를 입력해 주세요 :>", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .regular)])
    }
    
    func numberLine() {
        underLineImageView.backgroundColor = .white
    }
    
    func startingButton() {
        startButton.defaultButtonUI("시작하기", .black)
    }
}
