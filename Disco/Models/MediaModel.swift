//
//  MediaModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class MediaModel: Codable, ObservableObject, Identifiable {
	typealias ID = UUID
	@Published var id = UUID()
	var path: String { "Untitled" }
	@Published var modified = Date()
	@Published var created = Date()
	@Published var label: String?
	@Published var note: String?
}

extension MediaModel: Comparable {
	static func < (lhs: MediaModel, rhs: MediaModel) -> Bool { lhs.path < rhs.path }
	static func == (lhs: MediaModel, rhs: MediaModel) -> Bool { lhs.id == rhs.id }
}
