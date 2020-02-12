//
//  DiskModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class DiskModel: DirectoryModel {
	@Published var capacity = 0
	@Published var scanned: Date?
	@Published var kind = DiskKindsModel(kind: .bddl)

	convenience init(_ name: String) {
		self.init()
		filename = name
	}
}
