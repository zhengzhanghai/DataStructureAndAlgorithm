//
//  LeetCode5.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/25.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 最长回文子串
class LeetCode5 {
    
    func test() {
        print(longestPalindrome("cbbd"))
    }
    
    func longestPalindrome(_ s: String) -> String {
        var sArr = Array<Character>(s)
        let sArrCount = sArr.count
        
        guard sArrCount > 1 else {
            return s
        }
        
        var left = 0
        var right = 0
        
        for i in 0 ..< sArrCount {
            // 这儿要把长度不够的串过滤掉
            let num = sArrCount - i - 1 - right + left
            guard num >= 0 else {
                continue
            }
            for j in 0 ..< num {
                // 从长的开始找，找到就结束内循环
                let index = sArrCount - j - 1
                if isPalindrome(&sArr, i, index) {
                    left = i
                    right = index
                    break
                }
            }
            
            // 如果剩余的串已经没有已经找到的回文串长，没必要再找了
            if right - left + 1 >= sArrCount - i - 1 {
                break
            }
        }
        
        return String(sArr[left ... right])
    }
    
    /// 是否是对称字符数组
    func isPalindrome(_ chars: inout [Character], _ left: Int, _ right: Int) -> Bool {
        var left = left
        var right = right
        
        while left < right {
            if chars[left] != chars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
}

// a b c d c b a
