//
//  SolutionLinkedList.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/15.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionLinkedList {
    func hasCycle(_ head: ListNode?) -> Bool {
        var quickNode = head
        var lowNode = head
        
        while quickNode != nil && lowNode != nil {
            quickNode = quickNode?.next?.next
            lowNode = lowNode?.next
            
            if let quickNode = quickNode, let lowNode = lowNode {
                if quickNode === lowNode {
                    return true
                }
            }
        }
        
        return false
    }
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var currentNode = head
        var visitors = [ListNode]()
    
        while currentNode != nil {
            if isContains(visitors, currentNode) {
                return currentNode
            } else {
                visitors.append(currentNode!)
                currentNode = currentNode?.next
            }
        }
        
        return nil
    }
    
    func isContains(_ visitors: [ListNode], _ node: ListNode?) -> Bool {
        for listNode in visitors {
            if let node = node, listNode === node {
                return true
            }
        }
        return false
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var currentNode = headA
        var visitors = [ListNode]()
        
        while currentNode != nil {
            visitors.append(currentNode!)
        }
        
        currentNode = headB
        
        while currentNode != nil {
            if isContains(visitors, currentNode) {
                return currentNode
            }
        }
        
        return nil
    }
}

//MARK: 删除倒数第N个节点
extension SolutionLinkedList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var totalCount = 0
        var currentNode = head
        var hash = [Int: ListNode]()
        
        while currentNode != nil {
            totalCount += 1
            hash[totalCount] = currentNode!
            currentNode = currentNode?.next
        }
        
        guard totalCount >= n else {return head}
        
        if totalCount == n {
            let newHead = head?.next
            head?.next = nil
            return newHead
        } else {
            let node = hash[totalCount - n]
            let deNode = node?.next
            node?.next = deNode?.next
            deNode?.next = nil
            
            return head
        }
    }
}
