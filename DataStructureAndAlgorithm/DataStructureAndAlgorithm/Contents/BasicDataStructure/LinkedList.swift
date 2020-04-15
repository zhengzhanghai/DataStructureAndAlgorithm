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

