//
//  LeetCode25.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

///25. K 个一组翻转链表
class LeetCode25 {
    
    func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        _ = reverseKGroup(node1, 3)
        
    }
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 1 && head != nil else {
            return head
        }
        var newHead: ListNode? = nil
        var tempHead: ListNode? = head
        var count = 0
        var node: ListNode? = head
        var previousNode: ListNode? = nil
        var previousKTail: ListNode? = nil
        var isReverseTail = false
        
        while node != nil {
            guard count > 0 else {
                tempHead = node
                previousNode = node
                node = node?.next
                count += 1
                count %= k
                continue
            }
            let nextNode = node?.next
            previousNode?.next = node?.next
            node?.next = tempHead
            tempHead = node

            if nextNode == nil && count < k - 1 {
                isReverseTail = true
            } else if count == k - 1 {
                if newHead == nil {
                    newHead = tempHead
                }
                previousKTail?.next = tempHead
                previousKTail = previousNode
            }
            
            node = nextNode
            count += 1
            count %= k
        }
        
        if isReverseTail {
            previousNode = tempHead
            node = tempHead?.next
            while node != nil {
                let nextNoe = node?.next
                
                previousNode?.next = nextNoe
                previousKTail?.next = node
                node?.next = tempHead
                tempHead = node
                
                node = nextNoe
            }
        }
        
        return newHead == nil ? tempHead : newHead
    }
}
// 1 2 3   4 5 6
// 2 1 3   4 5 6
// 3 2 1   4 5 6
//123 213 231
