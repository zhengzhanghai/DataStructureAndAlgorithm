//
//  HashMap.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/17.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class HashMap {
    private let length = 10
    private var keys: [[Int]]
    private var values: [[Int]]
    
    init() {
        var array1 = [[Int]]()
        var array2 = [[Int]]()
        
        for _ in 0 ..< length {
            array1.append([])
            array2.append([])
        }
        
        self.keys = array1
        self.values = array2
    }
    
    func hash(_ key: Int) -> Int {
        return key % length
    }
    
    func find(_ key: Int) -> (row: Int, col: Int) {
        let row = hash(key)
        let array = keys[row]
        
        var col = -1
        for index in 0 ..< array.count {
            if array[index] == key {
                col = index
                break
            }
        }
        return (row, col)
    }
    
    func put(_ key: Int, _ value: Int) {
        let location = find(key)
        if location.col != -1 {
            values[location.row][location.col] = value
        } else {
            keys[location.row].append(key)
            values[location.row].append(value)
        }
    }
    
    func get(_ key: Int) -> Int {
        let location = find(key)
        if location.col != -1 {
            return values[location.row][location.col]
        } else {
            return -1
        }
    }
    
    func remove(_ key: Int) {
        let location = find(key)
        if location.col != -1 {
            keys[location.row].remove(at: location.col)
            values[location.row].remove(at: location.col)
        }
    }
}
