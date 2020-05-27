//
//  LeetCode392.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 判断子序列
class LeetCode392 {
    
    func test() {
        print(isSubsequence("abc", "ahbgdc"))
    }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sIndex = s.startIndex
        var tIndex = t.startIndex
        
        while sIndex < s.endIndex {
            let sChar = s[sIndex]
            var isFind = false
            while tIndex < t.endIndex {
                defer {
                    tIndex = t.index(after: tIndex)
                }
                if t[tIndex] == sChar {
                    isFind = true
                    break
                }
            }
            if !isFind {
                return false
            }
            
            sIndex = s.index(after: sIndex)
        }
        
        return sIndex == s.endIndex
    }
}
