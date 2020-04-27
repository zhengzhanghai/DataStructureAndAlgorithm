//
//  LeetCode17.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

// 17. 电话号码的字母组合
class LeetCode17 {
    func letterCombinations(_ digits: String) -> [String] {
        let array = Array<Character>(digits)
        
        let hash: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        var result: [String] = []
        
        for digit in array {
            result = letterCombinations(result, hash[digit]!)
        }
        
        return result
    }
    
    func letterCombinations(_ strs1: [String], _ strs2: [String]) -> [String] {
        guard strs1.count > 0 && strs2.count > 0 else {
            return strs1.isEmpty ? strs2 : strs1
        }
        
        var array = [String]()
        for str1 in strs1 {
            for str2 in strs2 {
                array.append(str1 + str2)
            }
        }
        
        return array
    }
}
