//
//  LeetCode206.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/7.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 反转链表
class LeetCode206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode? = head
        reverseList(head, head, head?.next, &newHead)
        return newHead
    }
    
    func reverseList(_ head: ListNode?,_ preNode: ListNode?, _ currNode: ListNode?, _ newHead: inout ListNode?) {
        guard currNode != nil else {
            return
        }
        let nextNode = currNode?.next
        preNode?.next = nextNode
        currNode?.next = head
        newHead = currNode
        reverseList(currNode, preNode, nextNode, &newHead)
    }
}
