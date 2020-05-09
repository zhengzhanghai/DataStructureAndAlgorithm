//
//  SloutionSeek.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/9.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionSeek {
    func test() {
        
    }
}

///
extension SolutionSeek {
    func intersect(_ nums1:[Int], _ nums2: [Int]) -> [Int] {
        var hash = [Int: Int]()
        for num in nums1 {
            if let count = hash[num] {
                hash[num] = count + 1
            } else {
                hash[num] = 1
            }
        }
        
        var result = [Int]()
        
        for num in nums2 {
            if let count = hash[num] {
                result.append(num)
                if count > 1 {
                    hash[num] = count - 1
                } else {
                    hash.removeValue(forKey: num)
                }
            }
        }
        
        return result
    }
}

extension SolutionSeek {
    /// 是否是异位词
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
