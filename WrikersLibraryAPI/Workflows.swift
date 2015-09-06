//
//  Workflows.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class Workflows: NSObject {
    var id: String = ""
    var name: String = ""
    var standard: Bool = true
    var hidden: Bool = false
    var customStatuses: [String : String] = ["id" : "", "name" : "", "standard" : "", "group" : "", "hidden" : ""]
}
