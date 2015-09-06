//
//  Task.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class Task: NSObject {
    var id: String = ""
    var title: String = ""
    var taskDescription: String = ""
    var briefDescription: String = ""
    var parentsIDs: [String] = []
    var sharedIDs: [String] = []
    var responsibleIDs: [String] = []
    var status: String = ""
    var importance: String = ""
    var createdDate: String = ""
    var updatedDate: String = ""
    var dates: [String : String] = ["type" : "", "duration" : "", "start" : "", "due" : ""]
    var scope: String = ""
    var authorIDs: [String] = []
    var accountIDs: String = ""
    var customStatusID: String = ""
    var permalink: String = ""
    var priority: String = ""
    var superTaskIDs: [String] = []
    var subTaskIDs: [String] = []
    var dependencyIDs: [String] = []
}
