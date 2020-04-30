//
//  LeetCode60.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 60. 第k个排列
class LeetCode60 {
    
    func test() {
        print(getPermutation(3, 3))
    }
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var result = ""
        var k = k - 1
        var nums = [Int]()
        var count = 1
        for index in 1 ... n {
            count *= index
            nums.append(index)
        }
        
        for index in 0 ..< n {
            if index == n - 1 {
                result +=  String(nums.first!)
                break
            }
            
            count /= (n - index)
            let num = nums[k / count]
            result += String(num)
            nums.remove(at: k / count)
            
            k %= count
        }
        
        return result
    }
}
