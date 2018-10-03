//
//  Stack.swift
//  Calculator
//
//  Created by John Tate on 10/3/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import Foundation

class Stack {
    
    private var floatStack = [Float]()
    
    func pop() -> Float? {
        return floatStack.removeLast()
    }
    
    func push(number: Float) {
        floatStack.append(number)
    }
    
    func log() {
        print(floatStack)
    }
    
    func count() -> Int {
        return floatStack.count
    }
    
    func empty() {
        floatStack = []
    }
}
