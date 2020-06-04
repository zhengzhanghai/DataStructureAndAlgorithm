//
//  LeetCode238.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/6/4.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 除自身以外数组的乘积
class LeetCode238 {
    
    func test() {
        print(productExceptSelf1([1,2,3,4]))
    }
    
    // 使用除法
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var product = 1
        var zeroCount = 0
        
        for num in nums {
            product *= (num == 0) ? 1 : num
            zeroCount += (num == 0) ? 1 : 0
        }
        
        var res = [Int](repeating: 0, count: nums.count)
        guard zeroCount < 2 else {
            return res
        }
        
        for index in 0 ..< nums.count {
            let num = nums[index]
            if num == 0 {
                res[index] = product
            } else {
                res[index] = (zeroCount == 0) ? (product / num) : 0
            }
        }
        
        return res
        
    }
    
    // 不适用除法
    func productExceptSelf1(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        
        for num in nums {
            res.append((res.last ?? 1) * num)
        }
        
        var r = 1
        for i in 0 ..< nums.count {
            let index = nums.count - i - 1
            let num = nums[index]
            res[index] = r * ((index - 1 >= 0) ? res[index - 1] : 1)
            r *= num
        }
        
        return res
    }
}
