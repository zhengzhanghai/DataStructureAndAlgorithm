//
//  LeetCode242.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/9.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 有效的字母异位词
class LeetCode242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var hash1 = [Character: Int]()
        var sIndex = s.startIndex
        let sEndIndex = s.endIndex
        while sIndex < sEndIndex {
            let char = s[sIndex]
            if let count = hash1[char] {
                hash1[char] = count + 1
            } else {
                hash1[char] = 1
            }
            sIndex = s.index(after: sIndex)
        }
        
        var hash2 = [Character: Int]()
        var tIndex = t.startIndex
        let tEndIndex = t.endIndex
        while tIndex < tEndIndex {
            let char = t[tIndex]
            if let count = hash2[char] {
                hash2[char] = count + 1
            } else {
                hash2[char] = 1
            }
            tIndex = t.index(after: tIndex)
        }
        
        guard hash1.count == hash2.count else {
            return false
        }
        
        for (char, count1) in hash1 {
            if let count2 = hash2[char] {
                if count1 != count2 {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
}
