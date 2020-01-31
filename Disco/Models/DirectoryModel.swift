//
//  DirectoryModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class DirectoryModel: MediaModel {
	var scanned: Date?
	var directories: [DirectoryModel] = []
	var files: [FileModel] = []
}