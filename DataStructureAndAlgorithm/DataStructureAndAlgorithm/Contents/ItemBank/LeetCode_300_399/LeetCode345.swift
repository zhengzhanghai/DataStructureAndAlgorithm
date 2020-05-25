//
//  LeetCode345.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/18.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 反转字符串中的元音字母
class LeetCode345 {
    
    func reverseVowels(_ s: String) -> String {
        guard !s.isEmpty else {
            return s
        }
        var chars = [Character](s)
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            let leftIsVowel = isVowel(chars[left])
            let rightIsVowel = isVowel(chars[right])
            
            if leftIsVowel && rightIsVowel {
                (chars[left], chars[right]) = (chars[right], chars[left])
                left += 1
                right -= 1
            } else {
                if !leftIsVowel {
                    left += 1
                }
                if !rightIsVowel {
                    right -= 1
                }
            }
        }
        
        return String(chars)
    }
    
    func isVowel(_ char: Character) -> Bool {
        switch char.lowercased() {
            case "a": return true
            case "e": return true
            case "i": return true
            case "o": return true
            case "u": return true
            default: return false
        }
    }
    
}
