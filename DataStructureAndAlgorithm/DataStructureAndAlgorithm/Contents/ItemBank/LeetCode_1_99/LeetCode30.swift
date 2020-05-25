//
//  LeetCode30.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/19.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 30. 串联所有单词的子串
class LeetCode30 {
    
    func test() {
        print(findSubstring("a", ["a"]))
    }
    
    /// 暴力法
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let wordLength = words.first?.count ?? 0
        let allWordLength = wordLength * words.count
        let sCount = s.count
        guard !words.isEmpty && sCount >= allWordLength else {return []}
        
        var wordMap = [String: Int]()
        for word in words {
            wordMap[word] = (wordMap[word] ?? 0) + 1
        }
        
        var sIndex = s.startIndex
        var res = [Int]()
        var index = 0
        
        while index <= sCount - allWordLength {
            
            var tempIndex = sIndex
            var strMap = [String: Int]()
            
            for _ in 0 ..< words.count {
                let index1 = s.index(tempIndex, offsetBy: wordLength)
                let str = String(s[tempIndex ..< index1])
                strMap[str] = (strMap[str] ?? 0) + 1
                tempIndex = index1
            }
            
            if wordMap == strMap {
                res.append(index)
            }
            
            sIndex = s.index(after: sIndex)
            index += 1
        }
        
        return res
    }
    
//    func findSubstring1(_ s: String, _ words: [String]) -> [Int] {
//        let wordLength = words.first?.count ?? 0
//        let allWordLength = wordLength * words.count
//        let sCount = s.count
//        guard !words.isEmpty && sCount >= allWordLength else {return []}
//        
//        var wordMap = [String: Int]()
//        for word in words {
//            wordMap[word] = (wordMap[word] ?? 0) + 1
//        }
//        
//        var sIndex = s.startIndex
//        var res = [Int]()
//        var index = 0
//        
//        for i in 0 ..< wordLength {
//            
//        }
//        
//        return res
//    }
}
