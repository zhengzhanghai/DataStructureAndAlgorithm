//
//  LeetCode451.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/9.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 根据字符出现频率排序
class LeetCode451 {
    func frequencySort(_ s: String) -> String {
        var strIndex = s.startIndex
        let strEndIndex = s.endIndex
        var hash = [Character: Int]()
        while strIndex < strEndIndex {
            let char = s[strIndex]
            if let count = hash[char] {
                hash[char] = count + 1
            } else {
                hash[char] = 1
            }
            strIndex = s.index(after: strIndex)
        }
        
        var res = ""
        var maxCountChar: Character = " "
        var maxCharCount = 0
        
        while hash.count > 0 {
            for (char, count) in hash {
                if count > maxCharCount {
                    maxCharCount = count
                    maxCountChar = char
                }
            }
            
            hash.removeValue(forKey: maxCountChar)
            
            while maxCharCount > 0 {
                res += String(maxCountChar)
                maxCharCount -= 1
            }
        }
        
        return res
    }
}
