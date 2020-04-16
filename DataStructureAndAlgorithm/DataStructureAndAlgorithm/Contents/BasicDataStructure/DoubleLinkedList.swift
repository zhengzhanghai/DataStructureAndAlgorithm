//
//  DoubleLinkedList.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/16.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class DoubleListNode {
    var val: Int
    var next: DoubleListNode?
    var prev: DoubleListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }
}

//MyLinkedList
class DoubleLinkedList {
    
    var head: DoubleListNode?
    var tail: DoubleListNode?
    
    init() {}
    
    /// 获取第n个节点的值
    func get(_ index: Int) -> Int {
        var currentNode: DoubleListNode? = head
        var count = 0
        while currentNode != nil && count < index {
            count += 1
            currentNode = currentNode?.next
        }
        
        return (count == index) ? (currentNode?.val ?? -1) : -1
    }
    
    /// 在链表头部添加元素
    func addAtHead(_ val: Int) {
        let node = DoubleListNode(val)
        node.next = head
        head?.prev = node
        head = node
        if tail == nil {
            tail = node
        }
    }
    
    func addAtTail(_ val: Int) {
        let node = DoubleListNode(val)
        if head == nil {
            head = node
            tail = node
        } else {
            node.prev = tail
            tail?.next = node
            tail = node
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
            let node = DoubleListNode(val)
            node.next = currentNode?.next
            currentNode?.next?.prev = node
            currentNode?.next = node
            node.prev = currentNode
            
            if node.next == nil {
                tail = node
            }
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
            head = head?.next
            if head == nil {
                tail = nil
            }
        } else if count == index - 1 {
            let deletedNode = currentNode?.next
            
            deletedNode?.next?.prev = currentNode
            currentNode?.next = deletedNode?.next
            if deletedNode?.next == nil {
                tail = currentNode
            }
        }
    }
}
