//
//  DiskKindsModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class DiskKindsModel: Codable, ObservableObject {
	enum Kind: String, Codable {
		case writable
		case network
		case floppy
		case cd
		case cdrw
		case dvd
		case dvdrw
		case dvdram
		case dvddl
		case bd
		case bdre
		case bddl
		case bdxl
		case bdrexl
		case unknown

		var isWritable: Bool {
			switch self {
			case .writable, .floppy, .cdrw, .dvdrw, .dvdram, .bdre, .bdrexl:
				return true
			default:
				return false
			}
		}
	}
	@Published var capacity: Int?
	@Published var kindName: String?
	@Published var isWritable = false

	static var sizes: [Kind: Int] = [
		.cd: 700.mb,
		.cdrw: 700.mb,
		.dvd: 4.gb,
		.dvdrw: 4.gb,
		.dvdram: 4.gb,
		.dvddl: 8.gb,
		.bd: 25.gb,
		.bdre: 25.gb,
		.bddl: 50.gb,
		.bdxl: 100.gb,
		.bdrexl: 100.gb,
		.unknown: Int.max
	]

	@Published var kind: Kind? {
		didSet {
			guard let kind = kind else {
				// setting to `nil` wipes out all data
				kindName = nil
				capacity = nil
				isWritable = false
				return
			}
			kindName = kind.rawValue
			isWritable = kind.isWritable
			capacity = Self.sizes[kind]
		}
	}

	convenience init(kind inKind: Kind) {
		self.init()
		kind = inKind
	}
}

extension DiskKindsModel {
	enum CodingKeys: String, CodingKey {
		case kindName
		case capacity
	}
}
