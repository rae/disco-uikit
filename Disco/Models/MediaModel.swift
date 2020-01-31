//
//  MediaModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class MediaModel: Codable {
	var id = UUID()
	var path: String { "Untitled" }
	var modified = Date()
	var created = Date()
	var label: String?
	var note: String?
}

extension MediaModel: Comparable {
	static func < (lhs: MediaModel, rhs: MediaModel) -> Bool { lhs.path < rhs.path }
	static func == (lhs: MediaModel, rhs: MediaModel) -> Bool { lhs.id == rhs.id }
}
