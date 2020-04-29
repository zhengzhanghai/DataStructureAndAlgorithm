//
//  LeetCode58.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 最后一个单词的长度
class LeetCode58 {
    func test() {
        print(lengthOfLastWord("a  "))
    }
    
    func lengthOfLastWord(_ s: String) -> Int {
        let sCount = s.count
        var length = 0
        var sIndex = s.startIndex
        var index = 0
        var previousLength = 0
        
        while index < sCount {
            let char = s[sIndex]
            if char == " " {
                if length != 0 {
                    previousLength = length
                }
                length = 0
            } else {
                length += 1
            }
            index += 1
            sIndex = s.index(after: sIndex)
        }
        
        return length == 0 ? previousLength : length
    }
}
