//
//  InterView64.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/6/2.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 求1+2+...+n
class InterView64 {
    func sumNums(_ n: Int) -> Int {
        return Int(Double(1 + n) / 2 * Double(n))
    }
}
