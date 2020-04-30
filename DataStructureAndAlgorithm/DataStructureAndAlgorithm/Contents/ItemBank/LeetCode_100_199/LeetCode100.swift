//
//  LeetCode100.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/30.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 100.相同的树
class LeetCode100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p!.val != q!.val {
            return false
        }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
