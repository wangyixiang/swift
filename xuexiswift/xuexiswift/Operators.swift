//
//  operators.swift
//  xuexiswift
//
//  Created by yixiang.wang on 4/6/15.
//  Copyright (c) 2015 wangyixiang. All rights reserved.
//

import Foundation

func runInOperators(){
    closedRangeOperator()
    halfOpenRangeOperator()
}

func closedRangeOperator(){
    println("闭区间操作符")
    println("(a...b)包括a和b的值")
    for index in 5...10 {
        println("index = \(index)")
    }
    println()
}

func halfOpenRangeOperator(){
    println("半闭区间操作符")
    println("(a..<b)不包括b的值")
    let numbers = [1,2,3,4,5,6,7,8,9.10,11]
    var count = numbers.count
    for index in 5..<count {
        println("index = \(index)")
    }
    println()
}