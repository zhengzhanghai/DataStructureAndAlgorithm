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
}
