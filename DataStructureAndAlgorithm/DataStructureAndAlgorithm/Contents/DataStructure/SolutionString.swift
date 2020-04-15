//
//  SolutionString.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/14.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionString: NSObject {
    func test() {
//        print(addBinary("1010", "1011"))
        
//        print(strStr("aaaa", "bb"))
        
        print(longestCommonPrefix(["dog","racecar","car"]))
    }
    
    //MARK: 二进制字符串求和
    /// 二进制字符串求和
    func addBinary(_ a: String, _ b: String) -> String {
        let aCount = a.count
        let bCount = b.count
        let count = max(aCount, bCount)
        var result = ""
        var extra = 0
        
        for index in 0 ..< count {
            let aIndex = aCount - index - 1
            let bIndex = bCount - index - 1
            
            var aNumber = 0
            var bNumber = 0
            
            if aIndex >= 0 {
                let aStrIndex = a.index(a.startIndex, offsetBy: aIndex)
                aNumber = Int(String(a[aStrIndex ... aStrIndex])) ?? 0
            }
            if bIndex >= 0 {
                let bStrIndex = b.index(b.startIndex, offsetBy: bIndex)
                bNumber = Int(String(b[bStrIndex ... bStrIndex])) ?? 0
            }
            
            let sum = aNumber + bNumber + extra
            if sum >= 2 {
                extra = 1
                result = String(sum - 2) + result
            } else {
                extra = 0
                result = String(sum) + result
            }
        }
        
        if extra == 1 {
            result = "1" + result
        }
        
        return result
    }
    
    //MARK: 查找第一个子串的位置
    /// 查找第一个子串的位置
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else {
            return -1
        }
        
        for index in (0 ... haystack.count - needle.count) {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: index)
            let subStr = haystack[startIndex ..< haystack.index(startIndex, offsetBy: needle.count)]
            if String(subStr) == needle {
                return index
            }
        }
        
        return -1
    }
    
    //MARK:字符串最长公共前缀
    /// 字符串最长公共前缀
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        var commonPrefix = ""
        for index in 0 ... Int.max {
            var isContinue = true
            var currentStr = ""
            for str in strs {
                guard str.count > index  else { // 字符串长度不够
                    isContinue = false
                    break
                }
                let s = String(str[str.index(str.startIndex, offsetBy: index) ... str.index(str.startIndex, offsetBy: index)])
                
                if currentStr == "" { // 是第一个字符串
                    currentStr = s
                } else {
                    if currentStr != s {
                        isContinue = false
                        break
                    }
                }
            }
            
            if isContinue {
                commonPrefix += currentStr
            } else {
                break
            }
        }
        
        return commonPrefix
    }
}

//MARK: 反转字符串的单词
extension SolutionArray {
    /// 反转字符串的单词
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
    
    func reverseWords3(_ s: String) -> String {
        var array = s.components(separatedBy: " ")
        for i in 0 ..< array.count {
            let str = array[i]
            var resultStr = ""
            for j in 0 ..< str.count {
                let index = str.count - j - 1
                resultStr += str[str.index(str.startIndex, offsetBy: index) ... str.index(str.startIndex, offsetBy: index)]
            }
            array[i] = resultStr
        }
        return array.joined(separator: " ")
    }
}
