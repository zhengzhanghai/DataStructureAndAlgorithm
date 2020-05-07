//
//  LeetCode24.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 24. 两两交换链表中的节点
class LeetCode24 {
//    func swapPairs(_ head: ListNode?) -> ListNode? {
//        var node = head
//        var head: ListNode? = nil
//        var prevousNode: ListNode? = nil
//        while node != nil {
//            guard let nodeNext = node?.next else {
//                break
//            }
//            let nodeNextNext = nodeNext.next
//
//            prevousNode?.next = nodeNext
//            nodeNext.next = node
//            node?.next = nodeNextNext
//
//            prevousNode = node
//            node = nodeNextNext
//
//            if head == nil {
//                head = nodeNext
//            }
//
//        }
//        return head == nil ? node : head
//    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let nextNode = head?.next
        swapPairs(nil, head)
        return nextNode ?? head
    }
    
    func swapPairs(_ previousNode: ListNode?, _ currNode: ListNode?) {
        guard currNode != nil && currNode?.next != nil else {
            return
        }
        
        let next = currNode?.next?.next
        let secondNode = currNode?.next
        previousNode?.next = secondNode
        secondNode?.next = currNode
        currNode?.next = next
        
        swapPairs(currNode, next)
    }
    
}


//  1  2  3  4
