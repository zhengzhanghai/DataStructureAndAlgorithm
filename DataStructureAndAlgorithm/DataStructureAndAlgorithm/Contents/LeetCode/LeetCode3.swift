//
//  LeetCode3.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/25.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 无重复字符的最长子串
class LeetCode3 {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var right = 0
        var maxLength = 0
        var set = Set<Character>()
        let sArr = Array<Character>(s)
        let sCount = sArr.count
        
        while right < sCount {
            let str = sArr[right]
            if set.contains(str) {
                set.remove(sArr[left])
                left += 1
            } else {
                right += 1
                set.insert(str)
                maxLength = max(maxLength, right - left)
            }
        }
        
        return maxLength
    }
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var left = 0
//        var right = 0
//        var leftIndex = s.startIndex
//        var rightIndex = s.startIndex
//        let sCount = s.count
//        var set = Set<Character>()
//        var maxLength = 0
//
//        while right < sCount {
//            let char = s[rightIndex]
//            if set.contains(char) {
//                set.remove(s[leftIndex])
//                left += 1
//                leftIndex = s.index(after: leftIndex)
//            } else {
//                right += 1
//                rightIndex = s.index(after: rightIndex)
//                set.insert(char)
//                maxLength = max(maxLength, right - left)
//            }
//        }
//
//        return maxLength
//    }
}

//  a b c b c
