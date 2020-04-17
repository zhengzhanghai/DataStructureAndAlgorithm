//
//  Node.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/17.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}


public class Node1 {
    public var val: Int
    public var next: Node1?
    public var random: Node1?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
          self.random = nil
    }
}
