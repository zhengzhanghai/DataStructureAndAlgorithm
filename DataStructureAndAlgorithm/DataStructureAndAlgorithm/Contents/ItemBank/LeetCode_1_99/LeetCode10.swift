//
//  LeetCode10.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/6.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode10 {
    
    var memo: [[Bool?]]!
    var sLength: Int = 0
    var pLength: Int = 0
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        sLength = s.count
        pLength = p.count
        let subMemo = [Bool?](repeating: nil, count: pLength)
        memo = [[Bool?]](repeating: subMemo, count: sLength)
        return isMatch(0, 0, s, p)
    }
    
    func isMatch(_ i: Int, _ j: Int, _ s: String, _ p: String) -> Bool {
        if let result = memo[i][j] {
            return result
        }
        
     
        return false
    }
    
}
