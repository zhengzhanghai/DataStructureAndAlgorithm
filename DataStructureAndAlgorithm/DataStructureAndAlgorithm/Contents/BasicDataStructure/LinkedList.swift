//
//  LinkedList.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/15.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//MyLinkedList
class LinkedList {
    
    var head: ListNode?
    
    init() {}
    
    /// 获取第n个节点的值
    func get(_ index: Int) -> Int {
        var currentNode: ListNode? = head
        var count = 0
        while currentNode != nil && count < index {
            count += 1
            currentNode = currentNode?.next
        }
        
        return (count == index) ? (currentNode?.val ?? -1) : -1
    }
    
    /// 在链表头部添加元素
    func addAtHead(_ val: Int) {
        let node = ListNode(val)
        node.next = head
        head = node
    }
    
    func addAtTail(_ val: Int) {
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        let node = ListNode(val)
        if currentNode == nil {
            head = node
        } else {
            currentNode?.next = node
        }
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        var currentNode = head
        var count = 0
        while currentNode?.next != nil && count < index - 1 {
            currentNode = currentNode?.next
            count += 1
        }
        
        if index == 0 || currentNode == nil {
            addAtHead(val)
        } else if count == index - 1 {
            let node = ListNode(val)
            node.next = currentNode?.next
            currentNode?.next = node
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        var currentNode = head
        var count = 0
        while currentNode?.next != nil && count < index - 1 {
            currentNode = currentNode?.next
            count += 1
        }
        
        if index == 0 || currentNode == nil {
            let node = head
            head = head?.next
            node?.next = nil
        } else if count == index - 1 {
            let deletedNode = currentNode?.next
            currentNode?.next = deletedNode?.next
            deletedNode?.next = nil
        }
    }
    

}

//MARK: 链表反转
extension SolutionLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        let currentNode = head
        var newHead = head
        
        while currentNode?.next != nil {
            let nextNode = currentNode?.next
            currentNode?.next = nextNode?.next
            nextNode?.next = newHead
            newHead = nextNode
        }
        
        return newHead
    }
}

//MARK: 删除链表中为某值得所有节点
extension SolutionLinkedList {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var newHead = head
        var previousNode: ListNode? = nil
        var currentNode = head
        
        while currentNode != nil {
            
            if previousNode == nil { // 当前在头结点
                if currentNode!.val == val {
                    currentNode = currentNode?.next
                    newHead = currentNode
                } else {
                    previousNode = currentNode
                    currentNode = currentNode?.next
                }
            } else {
                if currentNode!.val == val {
                    previousNode?.next = currentNode?.next
                    currentNode = currentNode?.next
                } else {
                    previousNode = currentNode
                    currentNode = currentNode?.next
                }
            }
        }
        
        return newHead
    }
}

//MARK:奇偶链表,把奇数序号的节点放一起，偶数序号节点的放一起
extension SolutionLinkedList {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddHead: ListNode? = nil
        var oddTail: ListNode? = nil
        var evenTail: ListNode? = nil
        
        var current = head
        var count = 0
        
        while current != nil {
            if count % 2 == 0 { // 偶数序号节点
                evenTail = current
            } else { // 奇数序号节点
                if oddHead == nil {
                    oddHead = current
                }
                evenTail?.next = current?.next
                if oddTail == nil {
                    oddTail = current
                } else {
                    oddTail?.next = current
                }
                oddTail = current
            }
            
            count += 1
            current = current?.next
            oddTail?.next = nil
        }
        
        evenTail?.next = oddHead
        
        return head
    }
}
//  1   2   3   3
