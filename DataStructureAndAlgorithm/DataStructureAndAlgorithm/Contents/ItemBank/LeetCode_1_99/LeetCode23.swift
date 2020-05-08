//
//  LeetCode23.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

//23.合并K个有有序链表
class LeetCode23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let preHead: ListNode? = ListNode(0)
        var newLists = lists
        mergeKHeads(&newLists, preHead)
        return preHead?.next
    }
    
    func mergeKHeads(_ lists: inout [ListNode?], _ node: ListNode?) {
        var minVal = Int.max
        var minValNode: ListNode? = nil
        var minValIndex = -1
        
        for index in 0 ..< lists.count {
            guard let node = lists[index] else {
                continue
            }
            if node.val < minVal {
                minVal = node.val
                minValIndex = index
                minValNode = node
            }
        }
        
        if minValIndex >= 0 {
            node?.next = minValNode
            lists[minValIndex] = minValNode?.next
            mergeKHeads(&lists, minValNode)
        }
    }
}
