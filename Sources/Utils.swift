//
//  Utils.swift
//  TextCase-API
//
//  Created by Christopher Hannah on 25/06/2017.
//
//

import Foundation

// arc4random substitute for Linux
//
// https://gist.github.com/rymcol/48a505c2a1c874daea52a296a2687f5f

#if os(Linux)
	import SwiftGlibc
	
	public func arc4random_uniform(_ max: UInt32) -> UInt32 {
		return (SwiftGlibc.rand() % UInt32(max-1))
	}
#endif
