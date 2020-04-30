//
//  LeetCode9.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/26.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode9 {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        guard x % 10 != 0 || x == 0 else {
            return false
        }
        
        var x = x
        var num = 0
        while x > num {
            num = num * 10 + x % 10
            x /= 10
        }
        
        return x == num || x == num / 10
    }
    
    
}



// 1 2 2 2 1
  
