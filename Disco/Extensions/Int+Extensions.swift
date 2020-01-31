//
//  Int+Extensions.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation

extension Int {
	// old, power-of-2 SI units
	var kb: Int { self * 1024 }
	var mb: Int { kb * 1024 }
	var gb: Int { mb * 1024 }
	var tb: Int { gb * 1024 }

	// new, power-of-10 SI units
	var kib: Int { self * 1000 }
	var mib: Int { kib * 1000 }
	var gib: Int { mib * 1000 }
	var tib: Int { gib * 1000 }
}
