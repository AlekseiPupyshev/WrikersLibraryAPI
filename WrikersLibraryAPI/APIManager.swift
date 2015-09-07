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
            var folder = Folder()
            
            folder.id = json["data"][folderElem]["id"].stringValue
            folder.title = json["data"][folderElem]["title"].stringValue
            folder.createdDate = json["data"][folderElem]["createdDate"].stringValue
            folder.briefDescription = json["data"][folderElem]["briefDescription"].stringValue
            folder.folderDescription = json["data"][folderElem]["folderDescription"].stringValue
            folder.sharedIDs = json["data"][folderElem]["sharedIds"].arrayObject as! [String]
            folder.parentsIDs = json["data"][folderElem]["parentIds"].arrayObject as! [String]
            folder.scope = json["data"][folderElem]["scope"].stringValue
            folder.hasAttachments = json["data"][folderElem]["hasAttachments"].boolValue
            folder.permalink = json["data"][folderElem]["permalink"].stringValue
            folder.workflowID = json["data"][folderElem]["workflowId"].stringValue
            folder.childIDs = json["data"][folderElem]["childIds"].arrayObject as! [String]
            
            folders.append(folder)
        }
        
        return folders
    }
    
    func createFolder(data: NSData) -> Folder {
        var json = JSON(data: data)
        var folder = Folder()
        
        folder.id = json["data"]["id"].stringValue
        folder.title = json["data"]["title"].stringValue
        folder.createdDate = json["data"]["createdDate"].stringValue
        folder.briefDescription = json["data"]["briefDescription"].stringValue
        folder.folderDescription = json["data"]["folderDescription"].stringValue
        folder.sharedIDs = json["data"]["sharedIds"].arrayObject as! [String]
        folder.parentsIDs = json["data"]["parentIds"].arrayObject as! [String]
        folder.scope = json["data"]["scope"].stringValue
        folder.hasAttachments = json["data"]["hasAttachments"].boolValue
        folder.permalink = json["data"]["permalink"].stringValue
        folder.workflowID = json["data"]["workflowId"].stringValue
        folder.childIDs = json["data"]["childIds"].arrayObject as! [String]
        
        return folder
    }
    
    
    // MARK: - Tasks
    
    func getTasks(data: NSData) -> [Task] {
        var json = JSON(data: data)
        var tasks: [Task] = []
        
        for taskElem in 0...json["data"].count - 1 {
            var task = Task()
            
            task.id = json["data"][taskElem]["id"].stringValue
            task.title = json["data"][taskElem]["title"].stringValue
            task.taskDescription = json["data"][taskElem]["description"].stringValue
            task.briefDescription = json["data"][taskElem]["briefDescription"].stringValue
            task.parentsIDs = json["data"][taskElem]["parentIds"].arrayObject as! [String]
            task.sharedIDs = json["data"][taskElem]["sharedIds"].arrayObject as! [String]
            task.responsibleIDs = json["data"][taskElem]["responsibleIds"].arrayObject as! [String]
            task.status = json["data"][taskElem]["status"].stringValue
            task.importance = json["data"][taskElem]["importance"].stringValue
            task.permalink = json["data"][taskElem]["permalink"].stringValue
            task.createdDate = json["data"][taskElem]["createdDate"].stringValue
            task.updatedDate = json["data"][taskElem]["updatedDate"].stringValue
            task.scope = json["data"][taskElem]["scope"].stringValue
            task.authorIDs = json["data"][taskElem]["authorIds"].arrayObject as! [String]
            task.accountIDs = json["data"][taskElem]["accountIDs"].stringValue
            task.customStatusID = json["data"][taskElem]["customStatusId"].stringValue
            task.permalink = json["data"][taskElem]["permalink"].stringValue
            task.priority = json["data"][taskElem]["priority"].stringValue
            task.superTaskIDs = json["data"][taskElem]["superTaskIds"].arrayObject as! [String]
            task.subTaskIDs = json["data"][taskElem]["subTaskIds"].arrayObject as! [String]
            
            tasks.append(task)
        }
        
        return tasks
    }
    
    func createTask(data: NSData) -> Task {
        var json = JSON(data: data)
        var task = Task()
        
        task.id = json["data"]["id"].stringValue
        task.title = json["data"]["title"].stringValue
        task.taskDescription = json["data"]["description"].stringValue
        task.briefDescription = json["data"]["briefDescription"].stringValue
        task.parentsIDs = json["data"]["parentIds"].arrayObject as! [String]
        task.sharedIDs = json["data"]["sharedIds"].arrayObject as! [String]
        task.responsibleIDs = json["data"]["responsibleIds"].arrayObject as! [String]
        task.status = json["data"]["status"].stringValue
        task.importance = json["data"]["importance"].stringValue
        task.permalink = json["data"]["permalink"].stringValue
        task.createdDate = json["data"]["createdDate"].stringValue
        task.updatedDate = json["data"]["updatedDate"].stringValue
        task.scope = json["data"]["scope"].stringValue
        task.authorIDs = json["data"]["authorIds"].arrayObject as! [String]
        task.accountIDs = json["data"]["accountIDs"].stringValue
        task.customStatusID = json["data"]["customStatusId"].stringValue
        task.permalink = json["data"]["permalink"].stringValue
        task.priority = json["data"]["priority"].stringValue
        task.superTaskIDs = json["data"]["superTaskIds"].arrayObject as! [String]
        task.subTaskIDs = json["data"]["subTaskIds"].arrayObject as! [String]
    
        return task
    }
    
    // MARK: - Comments
    
    func getComments(data: NSData) -> [Comment] {
        var json = JSON(data)
        var comments: [Comment] = []
        
        for commentElem in 0...json["data"].count - 1 {
            var comment = Comment()
            
            comment.id = json["data"][commentElem]["id"].stringValue
            comment.authorID = json["data"][commentElem]["authorId"].stringValue
            comment.text = json["data"][commentElem]["text"].stringValue
            comment.updatedDate = json["data"][commentElem]["updatedDate"].stringValue
            comment.taskID = json["data"][commentElem]["taskId"].stringValue
            
            comments.append(comment)
        }
        
        return comments
    }
    
    func createComment(data: NSData) -> Comment {
        var json = JSON(data)
        var comment = Comment()
            
        comment.id = json["data"]["id"].stringValue
        comment.authorID = json["data"]["authorId"].stringValue
        comment.text = json["data"]["text"].stringValue
        comment.updatedDate = json["data"]["updatedDate"].stringValue
        comment.taskID = json["data"]["taskId"].stringValue
            
        return comment
    }
    
    func updateComment(data: NSData) -> Comment {
        var json = JSON(data)
        var comment = Comment()
        
        comment.id = json["data"]["id"].stringValue
        comment.authorID = json["data"]["authorId"].stringValue
        comment.text = json["data"]["text"].stringValue
        comment.updatedDate = json["data"]["updatedDate"].stringValue
        comment.taskID = json["data"]["taskId"].stringValue
        
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
