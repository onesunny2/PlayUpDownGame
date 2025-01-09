//
//  UpdownGame.swift
//  PlayUpDownGame
//
//  Created by Lee Wonsun on 1/9/25.
//

import Foundation

class UpdownGame {
    
    static let gamename = "UP DOWN"
    var setNum: Int
    var numList: [String] {
        var stringList: [String] = []
        for num in 1...setNum {
            stringList.append(String(num))
        }
        
        return stringList
    }
    var countNum: Int
    var isSelected: Bool = false
    
    init(setNum: Int, countNum: Int) {
        self.setNum = setNum
        self.countNum = countNum
    }
}
