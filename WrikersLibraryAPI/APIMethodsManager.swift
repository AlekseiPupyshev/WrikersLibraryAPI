//
//  APIMethodsManager.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class APIMethodsManager: NSObject {
    var sharedInstance = APIMethodsManager()
    
    let httpManager: HTTPManager
    let apiManager: APIManager
    
    var accessCode: String = ""
    var token: String = ""
    var refreshToken: String = ""
    let clientID: String = ""
    let clientSecret: String = ""
    
    private override init() {
        httpManager = HTTPManager()
        apiManager = APIManager()
        
        super.init()
    }
    
    func getToken(refresh: Bool) {
        var url = ""
        var (data, error) = (NSData?(), NSError?())
        
        if refresh { // Update current token
            var parameters = "client_id=" + clientID + "&client_secret=" + clientSecret + "&grant_type=refresh_token&refrefresh_token=" + refreshToken
            (data, error) = httpManager.postRequest(url, parameters: parameters, token: "")
            
        } else { // Get new token
            var parameters = "client_id=" + clientID + "&client_secret=" + clientSecret + "&grant_type=authorization_code&code=" + accessCode
            var (data, error) = httpManager.postRequest(url, parameters: parameters, token: "")
        }
        
        if error != nil {
            println("Error in \"getToken\" - \(error?.localizedDescription)")
        } else if let data = data {
            let json = JSON(data: data)
            
            if json["error"].stringValue != "" {
                let error = json["error"].stringValue
                let errorDescription = json["errorDescription"].stringValue
                println("Error in JSON: \n \(error) - \(errorDescription)")
            } else {
                token = json["access_token"].stringValue
                refreshToken = json["refresh_token"].stringValue
            }
        }
    }
    
    
    // MARK: - Contact methods
    
    func getAllContacts() -> [Contact]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getAllContacts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getContacts(data!)
        }
        
        return nil
    }
    
    func getContactsIn(Account id: String) -> [Contact]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getContactsInAccount' - \(error?.localizedDescription)")
        } else {
            return apiManager.getContacts(data!)
        }
        
        return nil
    }
    
    func getContactsBy(IDs: [String]) -> [Contact]? {
        var (data, error) = httpManager.getRequest("", parameters: ",".join(IDs), token: token)
        
        if error != nil {
            println("Error in 'getContactsByIDs' - \(error?.localizedDescription)")
        } else {
            return apiManager.getContacts(data!)
        }
        
        return nil
    }
    
    // MARK: - Account methods
    
    func getAllAccount() -> [Account]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getAllAccount' - \(error?.localizedDescription)")
        } else {
            return apiManager.getAccounts(data!)
        }
        
        return nil
    }
    
    func getAccountsBy(IDs: [String]) -> [Account]? {
        var (data, error) = httpManager.getRequest("", parameters: ",".join(IDs), token: token)
        
        if error != nil {
            println("Error in 'getContactsByIDs' - \(error?.localizedDescription)")
        } else {
            return apiManager.getAccounts(data!)
        }
        
        return nil
    }
    
    // MARK: - Workflow method
    
    func getWorkflowsIn(Account id: String) -> [Workflow]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getWorkflowsInAccount' - \(error?.localizedDescription)")
        } else {
            return apiManager.getWorkflows(data!)
        }
        
        return nil
    }
    
    // MARK: - FolderTree methods
    
    func getFolderTreeInAllAccounts() -> [FolderTree]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getFolderTreeInAllAccounts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolderTree(data!)
        }
        
        return nil
    }
    
    func getFolderTreeInAccountBy(id: String) -> [FolderTree]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getFolderTreeInAccountBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolderTree(data!)
        }
        
        return nil
    }
    
    func getFolderTreeInFoldersBy(id: String) -> [FolderTree]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getFolderTreeInFoldersBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolderTree(data!)
        }
        
        return nil
    }
    
    // MARK: - Folder methods
    
    func getFoldersBy(IDs: [String]) -> [Folder]? {
        var (data, error) = httpManager.getRequest("", parameters: ",".join(IDs), token: token)
        
        if error != nil {
            println("Error in 'getFoldersBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolders(data!)
        }
        
        return nil
    }
    
    func createFolder() -> Folder? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createFolder' - \(error?.localizedDescription)")
        } else {
            return apiManager.createFolder(data!)
        }
        
        return nil
    }
    
    // MARK: - Taksk methods
    
    func getTasksInAllAccounts() -> [Task]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getTasksInAllAccounts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func getTasksInAccountBy(id: String) -> [Task]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getTasksInAccountBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func getTasksInFolderBy(id: String) -> [Task]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getTasksInFolderBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func getTasksBy(IDs: [String]) -> [Task]? {
        var (data, error) = httpManager.getRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getTasksBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func createTask() -> Task? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createTask' - \(error?.localizedDescription)")
        } else {
            return apiManager.createTask(data!)
        }
        
        return nil
    }
    
    // MARK: - Comment methods
    
    func getCommentsInAllAccounts() -> [Comment]? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getCommentsInAllAccounts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsInAccountBy(id: String) -> [Comment]? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getCommentsInAccountBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsInFolderBy(id: String) -> [Comment]? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getCommentsInFolderBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsInTaskBy(id: String) -> [Comment]? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getCommentsInTaskBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsBy(IDs: [String]) -> [Comment]? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getCommentsBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func createCommentInFolderBy(id: String) -> Comment? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createCommentInFolder' - \(error?.localizedDescription)")
        } else {
            return apiManager.createComment(data!)
        }
        
        return nil
    }
    
    func createCommentInCommentBy(id: String) -> Comment? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createCommentInComment' - \(error?.localizedDescription)")
        } else {
            return apiManager.createComment(data!)
        }
        
        return nil
    }
    
    func updateCommentInFolderBy(id: String) -> Comment? {
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'updateCommentInFolderBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.updateComment(data!)
        }
        
        return nil
    }
    
    func deleteCommentBy(id: String) {
        
    }
    
}
