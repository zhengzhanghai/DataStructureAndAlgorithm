//
//  SolutionLogger.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/18.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit


class Logger {

    var messageHash: [String: Int]

    init() {
        self.messageHash = [:]
    }
    
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let timestamp1 = messageHash[message], timestamp - timestamp1 < 10 {
            return false
        } else {
            messageHash[message] = timestamp
        }
        return true
    }
}
