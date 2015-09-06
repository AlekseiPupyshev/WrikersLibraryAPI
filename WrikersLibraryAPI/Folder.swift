//
//  Folder.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class Folder: NSObject {
    var id: String = ""
    var title: String = ""
    var createdDate: String = ""
    var briefDescription: String = ""
    var folderDescription: String = ""
    var sharedIDs: [String] = []
    var parentsIDs: [String] = []
    var scope: String = ""
    var hasAttachments: Bool = false
    var permalink: String = ""
    var workflowID: String = ""
    var childIDs: [String] = []
}
