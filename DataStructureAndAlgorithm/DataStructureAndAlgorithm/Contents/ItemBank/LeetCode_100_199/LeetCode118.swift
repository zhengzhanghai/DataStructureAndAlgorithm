//
//  LeetCode118.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/7.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode118 {
    func generate(_ numRows: Int) -> [[Int]] {
        var res = [[Int]]()
        guard numRows > 0 else {
            return res
        }
        helper(1, numRows, [], &res)
        return res
    }
    
    func helper(_ currRow: Int, _ numRows: Int, _ preNums: [Int], _ res: inout [[Int]]) {
        guard currRow <= numRows else {
            return
        }
        
        var nums = [Int]()
        
        if currRow == 1 {
            nums = [1]
        } else {
            for index in 0 ..< currRow {
                var num1 = 0
                if index - 1 >= 0 {
                    num1 = preNums[index - 1]
                }
                var num2 = 0
                if index < preNums.count {
                    num2 = preNums[index]
                }
                nums.append(num1 + num2)
            }
        }
                
        res.append(nums)
        helper(currRow + 1, numRows, nums, &res)
    }
}
