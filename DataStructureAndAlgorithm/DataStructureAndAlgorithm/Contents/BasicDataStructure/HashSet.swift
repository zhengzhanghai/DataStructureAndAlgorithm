//
//  HashSet.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/17.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class HashSet {
    
    private let length = 10
    private var datas: [[Int]]
    
    init() {
        var array = [[Int]]()
        for _ in 0 ..< length {
            array.append([])
        }
        self.datas = array
    }
    
    private func hash(_ val: Int) -> Int {
        return val % length
    }
    
    func add(_ key: Int) {
        guard !contains(key) else {
            return
        }
        datas[hash(key)].append(key)
    }
    
    func remove(_ key: Int) {
        datas[hash(key)].removeAll { (val) -> Bool in
            return val == key
        }
    }
    
    func contains(_ key: Int) -> Bool {
        return datas[hash(key)].contains(key)
    }
}
