//
//  APIManager.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    // MARK: - Contacts
    
    func getContacts(data: NSData) -> [Contact] {
        var json = JSON(data: data)
        var contacts: [Contact] = []
        
        for contactElem in 0...json["data"].count - 1 {
            var contact = Contact()
            
            contact.id = json["data"][contactElem]["id"].stringValue
            contact.firstName = json["data"][contactElem]["firstName"].stringValue
            contact.lastName = json["data"][contactElem]["lastName"].stringValue
            contact.type = json["data"][contactElem]["type"].stringValue
            contact.avatarURL = json["data"][contactElem]["avatarUrl"].stringValue
            contact.timezone = json["data"][contactElem]["timezone"].stringValue
            contact.locale = json["data"][contactElem]["locale"].stringValue
            contact.deleted = json["data"][contactElem]["deleted"].boolValue
            
            contacts.append(contact)
        }
        
        return contacts
    }
    
    // MARK: - Accounts
    
    func getAccounts(data: NSData) -> [Account] {
        var json = JSON(data: data)
        var accounts: [Account] = []
        
        for accountElem in 0...json["data"].count - 1 {
            var account = Account()
            
            account.id = json["data"][accountElem]["id"].stringValue
            account.name = json["data"][accountElem]["name"].stringValue
            account.dateFormat = json["data"][accountElem]["dateFormat"].stringValue
            account.firstDayOfWeek = json["data"][accountElem]["firstDayOfWeek"].stringValue
            account.workDays = json["data"][accountElem]["workDays"].arrayObject as! [String]
            account.rootFolderID = json["data"][accountElem]["rootFolderId"].stringValue
            account.recycleBinID = json["data"][accountElem]["recycleBinId"].stringValue
            account.createDate = json["data"][accountElem]["createDate"].stringValue
            account.subscription = json["data"][accountElem]["subscription"].arrayObject as! [String]
            
            accounts.append(account)
        }
        
        return accounts
    }
    
    // MARK: - Workflows
    
    func getWorkflows(data: NSData) -> [Workflow] {
        var json = JSON(data: data)
        var workflows: [Workflow] = []
        
        for workflowElem in 0...json["data"].count - 1 {
            var workflow = Workflow()
            
            workflow.id = json["data"][workflowElem]["id"].stringValue
            workflow.name = json["data"][workflowElem]["name"].stringValue
            workflow.standard = json["data"][workflowElem]["standart"].boolValue
            workflow.hidden = json["data"][workflowElem]["hidden"].boolValue
            
            workflows.append(workflow)
        }
        
        return workflows
    }
    
    // MARK: - Folders
    
    func getFolderTree(data: NSData) -> [FolderTree] {
        var json = JSON(data: data)
        var folders: [FolderTree] = []
        
        for folderTreeElem in 0...json["data"].count - 1 {
            var folder = FolderTree()
            
            folder.id = json["data"][folderTreeElem]["id"].stringValue
            folder.title = json["data"][folderTreeElem]["title"].stringValue
            folder.childIDs = json["data"][folderTreeElem]["childIds"].arrayObject as! [String]
            folder.scope = json["data"][folderTreeElem]["scope"].stringValue
            
            folders.append(folder)
        }
        
        return folders
    }
    
    func getFolders(data: NSData) -> [Folder] {
        var json = JSON(data: data)
        var folders: [Folder] = []
        
        for folderElem in 0...json["data"].count - 1 {
            folders.append(apiCreateFolder(json["data"][folderElem]) as Folder)
        }
        
        return folders
    }
    
    func createFolder(data: NSData) -> Folder {
        var json = JSON(data: data)
        return apiCreateFolder(json["data"])
    }
    
    
    func apiCreateFolder(json: JSON) -> Folder {
        var folder = Folder()
        
        folder.id = json["id"].stringValue
        folder.title = json["title"].stringValue
        folder.createdDate = json["createdDate"].stringValue
        folder.briefDescription = json["briefDescription"].stringValue
        folder.folderDescription = json["folderDescription"].stringValue
        folder.sharedIDs = json["sharedIds"].arrayObject as! [String]
        folder.parentsIDs = json["parentIds"].arrayObject as! [String]
        folder.scope = json["scope"].stringValue
        folder.hasAttachments = json["hasAttachments"].boolValue
        folder.permalink = json["permalink"].stringValue
        folder.workflowID = json["workflowId"].stringValue
        folder.childIDs = json["childIds"].arrayObject as! [String]
        
        return folder
    }
    
    // MARK: - Tasks
    
    func getTasks(data: NSData) -> [Task] {
        var json = JSON(data: data)
        var tasks: [Task] = []
        
        for taskElem in 0...json["data"].count - 1 {
            tasks.append(apiCreateTask(json["data"][taskElem]) as Task)
        }
        
        return tasks
    }
    
    func createTask(data: NSData) -> Task {
        var json = JSON(data: data)
        return apiCreateTask(json["data"]) as Task
    }
    
    func apiCreateTask(json: JSON) -> Task {
        var task = Task()
        
        task.id = json["id"].stringValue
        task.title = json["title"].stringValue
        task.taskDescription = json["description"].stringValue
        task.briefDescription = json["briefDescription"].stringValue
        task.parentsIDs = json["parentIds"].arrayObject as! [String]
        task.sharedIDs = json["sharedIds"].arrayObject as! [String]
        task.responsibleIDs = json["responsibleIds"].arrayObject as! [String]
        task.status = json["status"].stringValue
        task.importance = json["importance"].stringValue
        task.permalink = json["permalink"].stringValue
        task.createdDate = json["createdDate"].stringValue
        task.updatedDate = json["updatedDate"].stringValue
        task.scope = json["scope"].stringValue
        task.authorIDs = json["authorIds"].arrayObject as! [String]
        task.accountIDs = json["accountIDs"].stringValue
        task.customStatusID = json["customStatusId"].stringValue
        task.permalink = json["permalink"].stringValue
        task.priority = json["priority"].stringValue
        task.superTaskIDs = json["superTaskIds"].arrayObject as! [String]
        task.subTaskIDs = json["subTaskIds"].arrayObject as! [String]
        
        return task
    }
    
    // MARK: - Comments
    
    func getComments(data: NSData) -> [Comment] {
        var json = JSON(data)
        var comments: [Comment] = []
        
        for commentElem in 0...json["data"].count - 1 {
            comments.append(apiCreateComment(json["data"]) as Comment)
        }
        
        return comments
    }
    
    func createComment(data: NSData) -> Comment {
        var json = JSON(data)
        return apiCreateComment(json["data"]) as Comment
    }
    
    func updateComment(data: NSData) -> Comment {
        var json = JSON(data)
        return apiCreateComment(json["data"]) as Comment
    }
    
    func apiCreateComment(json: JSON) -> Comment {
        var comment = Comment()
        
        comment.id = json["id"].stringValue
        comment.authorID = json["authorId"].stringValue
        comment.text = json["text"].stringValue
        comment.updatedDate = json["updatedDate"].stringValue
        comment.taskID = json["taskId"].stringValue
        
        return comment
    }
    
    // MARK: - Attachemnts
    
    func getAttachmentsInFolder() {
        
    }
    
    func getAttachmentsInTask() {
        
    }
    
    func getAttachmentsByIDs() {
        
    }
    
    func downloadWrikeAttachmentByID() {
        
    }
    
    func getAccessURLForAttachmentByID() {
        
    }
    
    func downloadAttachmentPreviewByID() {
        
    }
    
    func createWrikeAttachmentInFolder() {
        
    }
    
    func createWrikeAttachmentInTaks() {
        
    }
    
    func updateAttachmentByID() {
        
    }
    
    func deleteAttachmentByID() {
        
    }
}
