//
//  LeetCode38.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 外观数列
class LeetCode38 {
    
    func test() {
        print(countAndSay(4))
    }
    
    func countAndSay(_ n: Int) -> String {
        guard n >= 1 else {return ""}
        
        var result = ""
        
        for index in 1 ... n {
            guard index != 1 else {
                result = "1"
                continue
            }
            
            var index = 0
            let count = result.count
            var strIndex = result.startIndex
            var currentNum: Character = " "
            var currentNumCount = 0
            var temp = ""
            
            while index < count {
                let char = result[strIndex]
                if char != currentNum {
                    if currentNumCount != 0 {
                        temp += String(currentNumCount) + String(currentNum)
                    }
                    
                    currentNum = char
                    currentNumCount = 1
                } else {
                    currentNumCount += 1
                }
                
                strIndex = result.index(after: strIndex)
                index += 1
            }
            
            if currentNumCount != 0 {
                temp += String(currentNumCount) + String(currentNum)
            }
            
            result = temp
        }
        
        return result
    }
}
