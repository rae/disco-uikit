//
//  CatalogModel.swift
//  Disco
//
//  Created by Reid Ellis on 2020-06-18.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import SwiftUI

class CatalogModel: Codable, ObservableObject, Identifiable {
	typealias ID = UUID
	@Published var id = UUID()
	var name = "Untitled"
	var disks: [DiskModel] = []
}
