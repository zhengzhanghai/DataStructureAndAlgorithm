//
//  LeetCode155.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/12.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode155 {

}

/// 最小栈
class MinStack {
    private var datas: [Int]
    private var minDatas: [Int]
    
    init() {
        self.datas = [Int]()
        self.minDatas = [Int]()
    }
    
    func push(_ x: Int) {
        datas.append(x)
        minDatas.append(min(x, minDatas.last ?? Int.max))
    }
    
    func pop() {
        if datas.count > 0 {
            datas.removeLast()
            minDatas.removeLast()
        }
    }
    
    func top() -> Int {
        return datas.last ?? 0
    }
    
    func getMin() -> Int {
        return minDatas.last ?? 0
    }
}
