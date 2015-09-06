//
//  Account.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class Account: NSObject {
    var id: String = ""
    var name: String = ""
    var dateFormat: String = ""
    var firstDayOfWeek: String = ""
    var workDays: [String] = []
    var rootFolderID: String = ""
    var recycleBinID: String = ""
    var createDate: String = ""
    var subscription: [String] = []
}
