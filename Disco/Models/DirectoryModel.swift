//
//  DirectoryModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class DirectoryModel: FileModel {
	@Published var directories: [DirectoryModel] = []
	@Published var files: [FileModel] = []
	convenience init(_ name: String, dirs dirList: [DirectoryModel] = [], files fileList: [FileModel] = [], parent dir: DirectoryModel? = nil) {
		self.init()
		directories = dirList
		files = fileList
		parentDirectory = dir
	}
}
