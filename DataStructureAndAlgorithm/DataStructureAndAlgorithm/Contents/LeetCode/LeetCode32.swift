//
//  LeetCode32.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 32. 最长有效括号
class LeetCode32 {
    func test() {
        print(longestValidParentheses("()()"))
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        let sCount = s.count
        var index = 0
        var maxValidLength = 0
        var array = [Character]()
        var indexs = [Int]()
        var hash = [Int: Int]()
        
        var sIndex = s.startIndex
        
        while index < sCount {
            let str = s[sIndex]
            let previous = array.last ?? "0"
            
            if str == ")" {
                if previous == "(" {
                    _ = array.removeLast()
                    let lastIndex = indexs.removeLast()
                    var length = index - lastIndex + 1
                    
                    if let previousLength = hash[lastIndex - 1] {
                        length += previousLength
                    }
                    hash[index] = length
                    maxValidLength = max(maxValidLength, length)
                } else {
                    hash.removeAll()
                }
            } else {
                array.append(str)
                if str == "(" {
                    indexs.append(index)
                }
            }
            
            sIndex = s.index(after: sIndex)
            index += 1
        }
        
        return maxValidLength
    }
}

//func longestValidParentheses(_ s: String) -> Int {
//    let sArr = Array<Character>(s)
//    var maxValidLength = 0
//    var array = [Character]()
//    var indexs = [Int]()
//    var hash = [Int: Int]()
//
//    for index in 0 ..< sArr.count {
//        let str = sArr[index]
//        let previous = array.last ?? "0"
//
//        if str == ")" {
//            if previous == "(" {
//                _ = array.removeLast()
//                let lastIndex = indexs.removeLast()
//                var length = index - lastIndex + 1
//
//                if let previousLength = hash[lastIndex - 1] {
//                    length += previousLength
//                }
//                hash[index] = length
//                maxValidLength = max(maxValidLength, length)
//            } else {
//                hash.removeAll()
//            }
//        } else {
//            array.append(str)
//            if str == "(" {
//                indexs.append(index)
//            }
//        }
//
//    }
//
//    return maxValidLength
//}
