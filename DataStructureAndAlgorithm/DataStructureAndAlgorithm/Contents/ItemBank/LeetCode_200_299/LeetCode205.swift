//
//  LeetCode205.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/9.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 同构字符串
class LeetCode205 {
//    func isIsomorphic(_ s: String, _ t: String) -> String {
//
//    }
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var hash1 = [Character: Int]()
        var hash2 = [Character: Int]()
        var sIndex = s.startIndex
        let sEndIndex = s.endIndex
        var tIndex = t.startIndex
        var index = 0
        
        while sIndex < sEndIndex {
            let str1 = s[sIndex]
            let str2 = t[tIndex]

            let index1 = hash1[str1]
            let index2 = hash2[str2]
            
            guard index1 == index2 else {
                return false
            }
            
            hash1[str1] = index
            hash2[str2] = index
            
            index += 1
            sIndex = s.index(after: sIndex)
            tIndex = t.index(after: tIndex)
        }
        
        return true
    }
}

