//
//  LeetCode21.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/5/1.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 21. 合并两个有序链表
class LeetCode21 {
    //方法一: 遍历比较大小
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var node1 = l1
//        var node2 = l2
//
//        var preNode: ListNode? = ListNode(-1)
//        let preHead: ListNode? = preNode
//
//        while node1 != nil || node2 != nil {
//            if node1 == nil || (node2 != nil && node2!.val < node1!.val) {
//                preNode?.next = node2
//                preNode = node2
//                node2 = node2?.next
//            } else {
//                preNode?.next = node1
//                preNode = node1
//                node1 = node1?.next
//            }
//        }
//
//        return preHead?.next
//    }
    
    // 方法二： 递归
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

// 1 2 3 4 5
// 1 3 4 6
