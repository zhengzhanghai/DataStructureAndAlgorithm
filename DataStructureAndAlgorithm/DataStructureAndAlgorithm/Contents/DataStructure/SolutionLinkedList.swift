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
//        let node4 = ListNode(1)
//        let node3 = ListNode(2)
//        node3.next = node4
//        let node2 = ListNode(2)
//        node2.next = node3
//        let node1 = ListNode(2)
//        node1.next = node2
//        let node = ListNode(1)
//        node.next = node1
//
//        _ = isPalindrome(node)
        let node1 = ListNode(3)
        let node2 = ListNode(4)
        node2.next = node1
        let node3 = ListNode(2)
        node3.next = node2
        
        let node4 = ListNode(4)
        let node5 = ListNode(6)
        node5.next = node4
        let node6 = ListNode(5)
        node6.next = node5
        
        print(addTwoNumbers(node3, node6))
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

//MARK: 链表两数相加
extension SolutionLinkedList {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let reversingList1 = reverseList(l1)
        let reversingList2 = reverseList(l2)
        var newList: ListNode? = nil
        var newNode: ListNode? = nil
        
        var node1 = reversingList1
        var node2 = reversingList2
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
            num = num % 10
            
            let node = ListNode(num)
            if newNode == nil {
                newNode = node
                newList = node
            } else {
                newNode?.next = node
                newNode = node
            }
            
            node1 = node1?.next
            node2 = node2?.next
        }
        
        if extraNum == 1 {
            let node = ListNode(extraNum)
            newNode?.next = node
            newNode = node
        }
        
        return reverseList(newList)
    }
}


//MARK: 扁平化多级双向链表
extension SolutionLinkedList {
    class Solution {
        func flatten(_ head: Node?) -> Node? {
            return flattenSub(head).head
        }
        
        func flattenSub(_ head: Node?) -> (head: Node?, tail: Node?) {
            var node = head
            var previousNode: Node? = nil
            
            while node != nil && node?.child == nil {
                previousNode = node
                node = node?.next
            }
            
            if node?.child == nil {
                return (head, previousNode ?? head)
            }
            
            let child = flattenSub(node?.child)
            let next = flattenSub(node?.next)
            
            node?.next = child.head
            child.head?.prev = node
            
            child.tail?.next = next.head
            next.head?.prev = child.tail
            node?.child = nil
            
            return (head, next.tail)
        }
    }
}

//MARK: 复制带随机指针的链表(深拷贝)
extension SolutionLinkedList {
    func copyRandomList(_ head: Node1?) -> Node1? {
        
        var originNodes = [Node1]()
        var newNodes = [Node1]()
        
        var node = head
        while node != nil {
            originNodes.append(node!)
            let newNode = Node1(node!.val)
            newNodes.append(newNode)
            node = node?.next
        }
        
        let newHead = newNodes.first
        var count = 0
        node = head
        
        while node != nil {
            if newNodes.count > count + 1 {
                newNodes[count].next = newNodes[count + 1]
            }
            
            if let random = node?.random {
                for index in 0 ..< originNodes.count {
                    if random === originNodes[index] {
                        newNodes[count].random = newNodes[index]
                        break
                    }
                }
            }
        
            count += 1
            node = node?.next
        }
        
        return newHead
    }
}

//MARK: 旋转链表
extension SolutionLinkedList {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var nodes = [ListNode]()
        var node = head
        
        while node != nil {
            nodes.append(node!)
            node = node?.next
        }
            
        guard nodes.count > 1 else {
            return head
        }
        
        let k = k % nodes.count
        
        guard k > 0 else {
            return head
        }
        
        let newHead = nodes[nodes.count - k]
        nodes.last?.next = head
        nodes[nodes.count - k - 1].next = nil
        
        return newHead
    }
}
