//
//  FileModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation
import SwiftUI

class FileModel : MediaModel {
	@Published var size = 0
	@Published var filename = "Untitled"

	let dirSep = "/"
	@Published var parentDirectory: DirectoryModel?

	override var path: String {
		get {
			var pathString = ""
			var dir = parentDirectory
			while let currentDir = dir {
				pathString = currentDir.filename + dirSep + pathString
				dir = currentDir.parentDirectory
			}
			if !pathString.isEmpty {
				pathString += dirSep
			}
			return pathString + filename
		}
	}
	convenience init(_ name: String = "Untitled", parent dir: DirectoryModel? = nil) {
		self.init()
		filename = name
		parentDirectory = dir
	}

	public func makeView() -> some View { FileView(file: self) }
}

extension FileModel {
	enum CodingKeys: String, CodingKey {
		case size
		case filename
	}
}
