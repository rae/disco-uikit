//
//  Data+Extensions.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

extension Data {
	func zipped() throws -> Data { try (self as NSData).compressed(using: .zlib) as Data }
	func unzipped() throws -> Data { try (self as NSData).decompressed(using: .zlib) as Data }
}
