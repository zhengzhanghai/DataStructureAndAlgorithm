//
//  LeetCode1431.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/6/1.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 拥有最多糖果的孩子
class LeetCode1431 {
    func kidsWithCandies(_ candies:[Int], _ extraCandies: Int) -> [Bool] {
        var maxCandy = 0
        for candy in candies {
            maxCandy = max(maxCandy, candy)
        }
        
        var res = [Bool]()
        for candy in candies {
            res.append(candy + extraCandies >= maxCandy)
        }
        
        return res
    }
}
