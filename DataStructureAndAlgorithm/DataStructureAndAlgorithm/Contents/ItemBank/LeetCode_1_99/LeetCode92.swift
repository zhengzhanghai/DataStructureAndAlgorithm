//
//  LeetCode92.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/30.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 92. 反转链表 II
class LeetCode92 {
    
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
        
        _ = reverseBetween(node1, 2, 4)
    }
    
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        var count = 1
        var node = head
        var lastNodeBeforeReverse: ListNode? = nil // 反转部分前面的最后一个节点
        var firstReverseNode: ListNode? = nil // 反转部分的第一个节点
        var reverseHead: ListNode? = nil // 反转部分的head
        
        while node != nil {
            if count > n {
                break
            } else if (count == m - 1) {
                lastNodeBeforeReverse = node
                node = node?.next
            } else if count == m {
                firstReverseNode = node
                reverseHead = node
                node = node?.next
            } else if count > m && count <= n {
                let nextNode = node?.next
                node?.next = reverseHead
                firstReverseNode?.next = nextNode
                lastNodeBeforeReverse?.next = node
                reverseHead = node
                node = nextNode
            } else {
                node = node?.next
            }
            count += 1
        }
        
        return m == 1 ? reverseHead : head
    }
}
