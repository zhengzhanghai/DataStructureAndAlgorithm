//
//  TreeNode.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/23.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
