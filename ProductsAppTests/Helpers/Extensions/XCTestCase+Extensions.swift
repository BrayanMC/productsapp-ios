//
//  XCTestCase+Extensions.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import XCTest

extension XCTestCase {
    
    func trackforMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Object should be deallocated. Memory leak detected.", file: file, line: line)
        }
    }
}
