//
//  LeetCode983.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/6.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode983 {
    
    func test() {
        print(mincostTickets([1,4,6,7,8,20], [2, 7, 15]))
    }
    
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: 366)
        for index in 1 ... 365 {
            if days.contains(index) {
                dp[index] = min(dp[index - 1] + costs[0],
                                dp[max(0, index - 7)] + costs[1] ,
                                dp[max(0, index - 30)] + costs[2])
            } else {
                dp[index] = dp[index - 1]
            }
            
        }
        return dp.last!
    }
}

