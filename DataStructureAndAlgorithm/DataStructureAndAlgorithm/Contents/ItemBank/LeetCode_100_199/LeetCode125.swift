//
//  LeetCode125.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/18.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 是否是回文串
class LeetCode125 {
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return true
        }
        var leftIndex = s.startIndex
        var rightIndex = s.index(before: s.endIndex)
    
        while leftIndex < rightIndex {
            let leftChar = s[leftIndex].lowercased()
            let leftCharASCII = leftChar.unicodeScalars.first!.value
            guard (leftCharASCII >= 48 && leftCharASCII <= 57) || (leftCharASCII >= 97 && leftCharASCII <= 122) else {
                leftIndex = s.index(after: leftIndex)
                continue
            }
            
            let rightChar = s[rightIndex].lowercased()
            let rightCharASCII = rightChar.unicodeScalars.first!.value
            guard (rightCharASCII >= 48 && rightCharASCII <= 57) || (rightCharASCII >= 97 && rightCharASCII <= 122) else {
                rightIndex = s.index(before: rightIndex)
                continue
            }
            
            if leftChar != rightChar {
                return false
            }
            
            leftIndex = s.index(after: leftIndex)
            rightIndex = s.index(before: rightIndex)
        }
        return true
    }
}


class PersonTest {
    
    var name: String {
        set {
            
        }
        
        get {
            return ""
        }
    }
    
    var name1111: String {
        return ""
    }
    
    
//    func ddddd() {
//        name = "zhang dan dan"
//        scale = 7
//    }
}
