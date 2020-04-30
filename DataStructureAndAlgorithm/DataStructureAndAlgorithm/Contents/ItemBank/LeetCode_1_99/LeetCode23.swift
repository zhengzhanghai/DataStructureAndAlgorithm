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
        var head: ListNode? = nil
        for list in lists {
            head = mergeTwoLists(head, list)
        }
        return head
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil && list2 != nil else {
            return list1 == nil ? list2 : list1
        }
        var head: ListNode? = nil
        var previous: ListNode? = nil
        
        var node1 = list1
        var node2 = list2
        
        while node1 != nil || node2 != nil {
            var node = node1
            if node1 == nil || (node1 != nil  && node2 != nil && node2!.val < node1!.val) {
                node = node2
            }
            let newNode = ListNode(node!.val)
            previous?.next = newNode
            previous = newNode
            
            if node === node1 {
                node1 = node1?.next
            } else {
                node2 = node2?.next
            }
            
            if head == nil {
                head = newNode
            }
            
        }
        
        return head
    }
}
