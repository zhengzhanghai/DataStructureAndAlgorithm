//
//  LeetCode7.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/26.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode7 {
    
    func test() {
        print(reverse(123))
    }
    
    func reverse(_ x: Int) -> Int {
        guard x >= Int16.min && x <= Int16.max else {
            return 0
        }
        var num = x
        var by = 10
        var nums = [Int]()
        while num != 0 {
            let num1 = num % by
            nums.append(num1)
            num /= by
        }
        
        by = 1
        for i in 0 ..< nums.count {
            let index = nums.count - i - 1
            num += nums[index] * by
            by *= 10
        }
        
        return num
    }
}
