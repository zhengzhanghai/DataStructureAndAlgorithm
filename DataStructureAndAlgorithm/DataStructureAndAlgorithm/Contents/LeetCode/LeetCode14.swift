//
//  LeetCode14.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        
        var minLength = Int.max
        var strArr = [[Character]]()
        for str in strs {
            let arr = Array<Character>(str)
            strArr.append(arr)
            minLength = min(minLength, arr.count)
        }
        
        var commonPrefix = ""
        for index in 0 ..< minLength {
            var isContinue = true
            var currentStr: Character = " "
            for arr in strArr {
                let s = arr[index]
                if currentStr == " " { // 是第一个字符串
                    currentStr = s
                } else {
                    if currentStr != s {
                        isContinue = false
                        break
                    }
                }
            }
            
            if isContinue {
                commonPrefix += String(currentStr)
            } else {
                break
            }
        }
        
        return commonPrefix
    }
}
