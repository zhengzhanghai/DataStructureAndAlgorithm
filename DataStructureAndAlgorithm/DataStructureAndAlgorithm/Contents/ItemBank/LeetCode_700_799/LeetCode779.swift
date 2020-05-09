//
//  LeetCode779.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/5/8.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 第K个语法符号
class LeetCode779 {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        if N == 1 {
            return 0
        }
        return (~K & 1) ^ kthGrammar(N-1, (K+1)/2)
    }
}
