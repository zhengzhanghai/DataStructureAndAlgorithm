//
//  LeetCode119.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/7.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 杨辉三角2
class LeetCode119 {
    func test() {
        print(getRow(3))
    }
    
    func getRow(_ numRows: Int) -> [Int] {
        guard numRows >= 0 else {
            return []
        }
        var res = [Int]()
        helper(0, numRows, [], &res)
        return res
    }
    
    func helper(_ currRow: Int, _ numRows: Int, _ preNums: [Int], _ res: inout [Int]) {
        var nums = [Int]()
        
        if currRow == 0 {
            nums = [1]
        } else {
            for index in 0 ... currRow {
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
               
        if currRow == numRows {
            res = nums
            return
        } else {
            helper(currRow + 1, numRows, nums, &res)
        }
    }
}
