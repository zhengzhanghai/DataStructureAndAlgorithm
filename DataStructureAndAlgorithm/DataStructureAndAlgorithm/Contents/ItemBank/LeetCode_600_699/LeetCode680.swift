//
//  LeetCode680.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/19.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 验证回文串
class LeetCode680 {
    
    func test() {
        print(validPalindrome("abc"))
    }
    
    func validPalindrome(_ s: String) -> Bool {
        
        var left = s.startIndex
        var right = s.index(before: s.endIndex)
        
        var isFirstNotEqual = true // 是否是第一次不相等
        var isValildLeft = false // 在第一次不相等时，在忽略左边也可忽略右边时，是否已经已经忽略了左边
        var tempLeft = left
        var tempRight = right
        
        while left < right {
            if s[left] != s[right] {
                if isFirstNotEqual {
                    isFirstNotEqual = false
                    if s[s.index(after: left)] == s[right] && s[s.index(before: right)] == s[left] {
                        tempLeft = left
                        tempRight = s.index(before: right)
                        left = s.index(after: left)
                    } else if s[s.index(after: left)] == s[right] {
                        left = s.index(after: left)
                    } else {
                        right = s.index(before: right)
                    }
                } else {
                    if !isValildLeft  {
                        isValildLeft = true
                        left = tempLeft
                        right = tempRight
                    } else {
                        return false
                    }
                }
            } else {
                left = s.index(after: left)
                right = s.index(before: right)
            }            
        }
        
        return true
    }
}

