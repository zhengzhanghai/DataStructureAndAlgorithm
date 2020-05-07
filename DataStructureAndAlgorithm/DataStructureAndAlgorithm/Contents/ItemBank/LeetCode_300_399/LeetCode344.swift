//
//  LeetCode344.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/7.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 反转字符串
class LeetCode344 {
    
    func reverseString(_ s: inout [Character]) {
        reverseString(0, s.count - 1, &s)
    }
    
    func reverseString(_ left: Int, _ right: Int, _ s: inout [Character]) {
        guard right > left else {
            return
        }
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        reverseString(left + 1, right - 1, &s)
    }
    
}
