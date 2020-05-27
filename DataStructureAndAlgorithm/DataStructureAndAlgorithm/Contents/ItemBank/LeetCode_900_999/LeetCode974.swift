//
//  LeetCode974.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 和可被整除的子数组
class LeetCode974 {
    func test() {
        print(subarraysDivByK([4,5,0,-2,-3,1], -5))
    }
    
    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        var res = 0
        
        // 记录前缀和余数出现的次数(余数：余数出现的次数)
        var map: [Int: Int] = [0 : 1]
        var sum = 0
        
        for num in A {
            sum += num
            // a % b
            // 当b是负数，我们希望map的key是负数或者0
            // 当b是正数，我们希望map的key是正数或者0
            // a % b 不满足上面的条件，需要修正
            sum = (sum % K + K) % K
            res += map[sum] ?? 0
            map[sum] = (map[sum] ?? 0) + 1
        }
        
        return res
    }
}
