//
//  SolutionPrimaryAlgorithm.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/24.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 力扣初级算法章节, 这里主要是动态规划的算法
class SolutionPrimaryAlgorithm {
    func test() {
//        print(climbStairs(44))
        print(rob([0]))
    }
}

//MARk: 爬楼梯
extension SolutionPrimaryAlgorithm {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else {
            return n
        }
        
        var hash = [1: 1, 2: 2]
        return climbStairs(n, &hash)
    }
    
    func climbStairs(_ n: Int, _ hash: inout [Int: Int]) -> Int {
        guard n > 2 else {
            return n
        }
        if let num = hash[n] {
            return num
        }
        let num1 = climbStairs(n - 2, &hash)
        hash[n - 2] = num1
        let num2 = climbStairs(n - 1, &hash)
        hash[n - 1] = num2
        return num1 + num2
    }
}

//MARK: 买股票的最佳时机
extension SolutionPrimaryAlgorithm {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var minPrice = prices[0]
        var maxPro = 0
        
        for index in 1 ..< prices.count {
            maxPro = max(maxPro, prices[index] - minPrice)
            minPrice = min(minPrice, prices[index])
        }
        
        return maxPro
    }
}

//MARK: 最大序列和
extension SolutionPrimaryAlgorithm {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var currentMaxSum = Int.min
        for num in nums {
            if currentMaxSum > 0 {
                currentMaxSum += num
            } else {
                currentMaxSum = num
            }
            maxSum = max(maxSum, currentMaxSum)
        }
        return maxSum
    }
}

//MARK:打家劫舍
extension SolutionPrimaryAlgorithm {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.first ?? 0
        }
        guard nums.count > 2 else {
            return max(nums[0], nums[1])
        }
        var previousMax = nums[0]
        var currentMax = max(nums[0], nums[1])
        
        for index in 2 ..< nums.count {
            if nums[index] + previousMax > currentMax {
                let temp = currentMax
                currentMax = nums[index] + previousMax
                previousMax = temp
            } else {
                previousMax = currentMax
            }
        }
        
        return currentMax
    }
}
