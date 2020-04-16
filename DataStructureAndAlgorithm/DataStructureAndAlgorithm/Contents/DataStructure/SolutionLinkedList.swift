//
//  SolutionLinkedList.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/15.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionLinkedList {
    func test() {
        let node4 = ListNode(1)
        let node3 = ListNode(2)
        node3.next = node4
        let node2 = ListNode(2)
        node2.next = node3
        let node1 = ListNode(2)
        node1.next = node2
        let node = ListNode(1)
        node.next = node1
        
        _ = isPalindrome(node)
    }
}

extension SolutionLinkedList {
    
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

//MARK: 回文链表
extension SolutionLinkedList {
    /// 第一种方法，运用快慢指针找中心位置，找到中心前将值存入栈或者数组
    /// 一次遍历解决问题，空间复杂度O(n/2)
//    func isPalindrome(_ head: ListNode?) -> Bool {
//
//        var fastNode = head
//        var slowNode = head
//        var isCenter = false
//        var nums = [Int]()
//
//        while slowNode != nil {
//
//            if isCenter { // 找到中心之后
//                if slowNode!.val != nums.removeLast() {
//                    return false
//                }
//            } else { // 找到中心之前
//                if fastNode?.next == nil { // 说明总结点数是奇数
//                    isCenter = true
//                } else if fastNode?.next?.next == nil { // 总节点数是偶数
//                    isCenter = true
//                    nums.append(slowNode!.val)
//                } else {
//                    nums.append(slowNode!.val)
//                }
//                fastNode = fastNode?.next?.next
//            }
//
//            slowNode = slowNode?.next
//        }
//
//        return true
//    }
    
    /// 第二种方法，快慢指针找中心点，找到前，将链表反转，找到后，从中间向两边遍历并比较
    /// 一次遍历，空间复杂度O(1)
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        var fastNode = head
        var slowNode = head
        var previousNode: ListNode? = nil
        var reversingNode: ListNode? = nil
        var findedCenter = false // 是否找到了中点
        
        while slowNode != nil {
            let slowNextNode = slowNode?.next
            let fastNextNode = fastNode?.next
            if findedCenter { // 找到中心之后
                if slowNode!.val != reversingNode!.val {
                    return false
                }
                reversingNode = reversingNode?.next
            } else { // 找到中心之前
                if fastNode?.next == nil { // 说明总结点数是奇数
                    findedCenter = true
                    reversingNode = previousNode
                } else if fastNode?.next?.next == nil { // 总节点数是偶数
                    findedCenter = true
                    reversingNode = slowNode
                    slowNode?.next = previousNode
                    previousNode = slowNode
                } else {
                    slowNode?.next = previousNode
                    previousNode = slowNode
                }
                fastNode = fastNextNode?.next
            }
            
            slowNode = slowNextNode
        }
        
        return true
    }
}


//MARK: 合并两个有序的链表
extension SolutionLinkedList {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode? = nil
        
        var node1 = l1
        var node2 = l2
        var currentNode: ListNode? = nil
        
        while node1 != nil || node2 != nil {
            let isAddNode1 = node2 == nil || (node1 != nil && node2 != nil && node1!.val <= node2!.val)
            let addedNode = isAddNode1 ? node1 : node2
            
            if currentNode == nil {
                currentNode = addedNode
                head = currentNode
            } else {
                currentNode?.next = addedNode
                currentNode = addedNode
            }
            
            if isAddNode1 {
                node1 = node1?.next
            } else {
                node2 = node2?.next
            }
        }
        
        return head
    }
}

