//
//  LeetCode86.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 分割链表
class LeetCode86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var leftList: ListNode?
        var leftTail: ListNode?
        var rightList: ListNode?
        var rightTail: ListNode?
        
        var node: ListNode? = head
        while node != nil {
            let newNode = ListNode(node!.val)
            if node!.val < x {
                leftTail?.next = newNode
                if leftList == nil {
                    leftList = newNode
                }
                leftTail = newNode
            } else {
                rightTail?.next = newNode
                if rightList == nil {
                    rightList = newNode
                }
                rightTail = newNode
            }
            
            node = node?.next
        }
        
        leftTail?.next = rightList
        
        return leftList == nil ? rightList : leftList
    }
}
