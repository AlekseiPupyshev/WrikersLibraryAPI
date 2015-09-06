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
        
        for workflowElem in 0...json["data"].count - 1 {
            var folder = FolderTree()
            
            folder.id = json["data"][workflowElem]["id"].stringValue
            folder.title = json["data"][workflowElem]["title"].stringValue
            folder.childIDs = json["data"][workflowElem]["childIds"].arrayObject as! [String]
            folder.scope = json["data"][workflowElem]["scope"].stringValue
            
            folders.append(folder)
        }
        
        return folders
    }
    
    func getFoldersByIDs() {
        
    }
    
    func createFolder() {
        
    }
    
    func modifyFolder() {
        
    }
    
    class func deleteFoldersByIDs() {
        
    }
    
    // MARK: - Tasks
    
    func getTasksInAllAccounts() {
        
    }
    
    func getTasksInAccount() {
        
    }
    
    func getTasksInFolder() {
        
    }
    
    func getTasksByIDs() {
        
    }
    
    class func createTask() {
        
    }
    
    func modifyTask() {
        
    }
    
    func deleteTaskByIDs() {
        
    }
    
    // MARK: - Comments
    
    func getCommentsInAllAccounts() {
        
    }
    
    func getCommentsInAccount() {
        
    }
    
    func getCommentsInFolder() {
        
    }
    
    func getCommentsInTask() {
    
    }
    
    func getCommentsByIDs() {
        
    }
    
    func createCommentInFolder() {
        
    }
    
    func createCommentInComment() {
        
    }
    
    func updateCommentInFolder() {
        
    }
    
    func deleteCommentByID() {
        
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
