//
//  DiskKindsModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

class DiskKindsModel: Codable {
	enum KindName: String, Codable {
		case writable
		case floppy
		case cd
		case dvd
		case dvddl
		case bd
		case bddl
		case bdxl
	}
	var capacity = 0
	var isEditable = false
	var kindName: KindName = .bddl
}
