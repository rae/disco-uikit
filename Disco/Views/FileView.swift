//
//  FileView.swift
//  Disco
//
//  Created by Reid Ellis on 2020-02-12.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation
import SwiftUI

struct FileView: View {
	@State var file: FileModel
	var body: some View {
		Text(file.filename)
	}
}
