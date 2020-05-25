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
        print(longestPalindrome2("babad"))
    }
    
    /// 暴力法
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


extension LeetCode5 {
    /// 中心扩散法
    func longestPalindrome1(_ s: String) -> String {
        let sCount = s.count
        guard sCount > 1 else {
            return s
        }
                
        var begin = 0
        var maxLen = 1
        
        var index = 0
        var sIndex = s.startIndex
        
        while index < sCount - 1 {
            let oddRes = lengthPalindrome(index, index, sIndex, sIndex, s, sCount)
            let evenRes = lengthPalindrome(index, index + 1, sIndex, s.index(after: sIndex), s, sCount)
            
            if oddRes.len > maxLen {
                begin = oddRes.begin
                maxLen = oddRes.len
            }
            if evenRes.len > maxLen {
                begin = evenRes.begin
                maxLen = evenRes.len
            }
            
            
            index += 1
            sIndex = s.index(after: sIndex)
        }
        
        let beginIndex = s.index(s.startIndex, offsetBy: begin)
        let endIndex = s.index(beginIndex, offsetBy: maxLen)
        return String(s[beginIndex ..< endIndex])
    }
    
    func lengthPalindrome(_ index1: Int, _ index2: Int, _ sIndex1: String.Index, _ sIndex2: String.Index, _ s: String, _ sCount: Int) -> (begin: Int, len: Int) {
        
        var left = index1
        var right = index2
        var leftIndex = sIndex1
        var rightIndex = sIndex2
        
        while left >= 0 && right < sCount && s[leftIndex] == s[rightIndex] {
            left -= 1
            right += 1
            if left >= 0 {
                leftIndex = s.index(before: leftIndex)
            }
            if right < sCount {
                rightIndex = s.index(after: rightIndex)
            }
        }
        
        return (left + 1, right - left - 1)
    }
}

extension LeetCode5 {
    /// 动态规划法
    func longestPalindrome2(_ s: String) -> String {
        let sCount = s.count
        guard sCount > 1 else {return s}
        var dp = [[Bool?]](repeating: [Bool?](repeating: nil, count: sCount), count: sCount)
        
        var begin = 0
        var resLen = 1
        
        var sIndex = s.startIndex
        var index = 0
        
        while index < sCount - resLen {
            var index1 = index + resLen
            var sIndex1 = s.index(sIndex, offsetBy: resLen)
            while index1 < sCount {
                guard index1 - index >= resLen else {
                    continue
                }
                
                if isPalindrome(index, index1, sIndex, sIndex1, s, &dp) {
                    if index1 - index + 1 > resLen {
                        begin = index
                        resLen = index1 - index + 1
                    }
                }
                
                index1 += 1
                sIndex1 = s.index(after: sIndex1)
            }
            index += 1
            sIndex = s.index(after: sIndex)
        }
    
        let beginIndex = s.index(s.startIndex, offsetBy: begin)
        let endIndex = s.index(beginIndex, offsetBy: resLen)
        return String(s[beginIndex ..< endIndex])
    }
    
    func isPalindrome(_ index1: Int, _ index2: Int, _ sIndex1: String.Index, _ sIndex2: String.Index, _ s: String, _ dp: inout [[Bool?]]) -> Bool {
        if let res = dp[index1][index2] {
            return res
        }
        
        if index1 == index2 {
            dp[index1][index2] = true
            return true
        }
        
        if s[sIndex1] == s[sIndex2] {
            if index1 + 1 == index2 {
                dp[index1][index2] = true
                return true
            } else {
                let res = isPalindrome(index1 + 1, index2 - 1, s.index(after: sIndex1), s.index(before: sIndex2), s, &dp)
                dp[index1][index2] = res
                return res
            }
        } else {
            dp[index1][index2] = false
            return false
        }
    }
}
//babad
