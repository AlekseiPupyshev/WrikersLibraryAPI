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
    
    func getAllAccounts() {
        
    }
    
    func getAccountsByIDs() {
        
    }
    
    func modifyAccount() {
        
    }
    
    // MARK: - Workflows
    
    func getWorkflowsInAccount() {
        
    }
    
    func createWorkfwlow() {
        
    }
    
    func modifyWorkflow() {
    
    }
    
    // MARK: - Folders
    
    func getFolderTreeInAllAccounts() {
        
    }
    
    func getFolderTreeInAccount() {
        
    }
    
    func getFolderTreeInFolders() {
        
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
