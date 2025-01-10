//
//  UpdownGame.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import Foundation
import UIKit

/*
 클래스 사용 목적: 네이밍, 숫자 및 배열 관리, 선택 여부 등 전체적인 게임 설정에 필요한
 내용물을 구성하고 관리하기 위함
 -> 왜 구조체가 아니고 클래스를 선택했을까?
    : 내 현재까지의 배움에서 판단은 구조체는 구조체의 구조를 통해 여러 인스턴스를 찍어내고 저장하는데 더 용이하고 잘 쓰이는 것 같고, 클래스는 만들어진 틀을 활용해 전체적으로 하나를 관리하는 느낌이었다. 그래서 선택해서 사용함
 */


class UpdownGame {
    
    static let gamename = "UP DOWN"
    
    var setNum: Int
    var countNum: Int
    var selectedNum: Int
    var cellList: [String] = []
    var isSelected: Bool = false
    var randomNum: Int = 0
    var entireNumList: [String] = []
    
    func checkAnswer(selected num: Int, _ label: UILabel) {

        if randomNum > num {

            if let index = cellList.firstIndex(of: String(num)) {
                cellList.removeSubrange(0...index)
            }
            
            print(cellList)
            
            label.commonDesign("UP", bool: false)

        } else if randomNum < num {

            if let index = cellList.firstIndex(of: String(num)) {
                cellList.removeSubrange(index...)
            }
            
            print(cellList)
            
            label.commonDesign("DOWN", bool: false)
            
            print("DOWN")
        } else if randomNum == num {
            label.commonDesign("GOOD", bool: false)
        }

    }
    
    init(setNum: Int, countNum: Int, selectedNum: Int) {
        self.setNum = setNum
        self.countNum = countNum
        self.selectedNum = selectedNum
    }
}



/*
 
 게임에 대한 클래스 생성한 김에 관련 인스턴스 매서드도 클래스 내부에서 처리
 
 
 
 */
