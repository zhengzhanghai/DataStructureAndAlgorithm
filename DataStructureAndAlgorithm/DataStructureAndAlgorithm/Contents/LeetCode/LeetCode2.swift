//
//  LeetCode2.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/24.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode2 {
    
    func test() {
//        let node1 = ListNode(3)
//        let node2 = ListNode(4)
//        node2.next = node1
//        let node3 = ListNode(2)
//        node3.next = node2
//
//        let node4 = ListNode(4)
//        let node5 = ListNode(6)
//        node5.next = node4
//        let node6 = ListNode(5)
//        node6.next = node5
        
//        _ = addTwoNumbers(node3, node6)
        
        _ = addTwoNumbers(ListNode(5), ListNode(5))
        
        
//        let node1 = ListNode(1)
//        let node2 = ListNode(8)
//        node1.next = node2
//
//        let node3 = ListNode(0)
//
//        _ = addTwoNumbers(node1, node3)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head1 = reverseList(l1)
        let head2 = reverseList(l2)
        
        var node1 = head1
        var node2 = head2
        var newHead: ListNode? = nil
        var previousNewNode: ListNode? = nil
        var extraNum = 0
        
        while node1 != nil || node2 != nil {
            var num1 = 0
            var num2 = 0
            
            if let node1 = node1 {
                num1 = node1.val
            }
            if let node2 = node2 {
                num2 = node2.val
            }
            
            var num = num1 + num2 + extraNum
            extraNum = num / 10
            num %= 10
            
            let node = ListNode(num)
            if newHead == nil {
                newHead = node
            }
            previousNewNode?.next = node
            previousNewNode = node
            
            node1 = node1?.next
            node2 = node2?.next
        }
        
        if extraNum == 1 {
            let node = ListNode(1)
            previousNewNode?.next = node
        }
        
        return newHead
    }
    
    /// 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var previousNode: ListNode? = nil
        
        while node != nil {
            let nextNode = node?.next
            node?.next = previousNode
            previousNode = node
            node = nextNode
        }
        
        return previousNode
    }
}
