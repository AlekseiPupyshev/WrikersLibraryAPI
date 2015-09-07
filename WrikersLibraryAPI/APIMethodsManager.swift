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
    
    func getAllContacts(parameters: String) -> [Contact]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/contacts", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getAllContacts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getContacts(data!)
        }
        
        return nil
    }
    
    func getContactsIn(Account id: String, parameters: String) -> [Contact]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/accounts/" + id + "contacts", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getContactsInAccount' - \(error?.localizedDescription)")
        } else {
            return apiManager.getContacts(data!)
        }
        
        return nil
    }
    
    func getContactsBy(IDs: [String], parameters: String) -> [Contact]? {
        var (data, error) = httpManager.getRequest("'https://www.wrike.com/api/v3/contacts/" + ",".join(IDs), parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getContactsByIDs' - \(error?.localizedDescription)")
        } else {
            return apiManager.getContacts(data!)
        }
        
        return nil
    }
    
    // MARK: - Account methods
    
    func getAllAccount(parameters: String) -> [Account]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/accounts", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getAllAccount' - \(error?.localizedDescription)")
        } else {
            return apiManager.getAccounts(data!)
        }
        
        return nil
    }
    
    func getAccountsBy(IDs: [String], parameters: String) -> [Account]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/accounts" + ",".join(IDs), parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getContactsByIDs' - \(error?.localizedDescription)")
        } else {
            return apiManager.getAccounts(data!)
        }
        
        return nil
    }
    
    // MARK: - Workflow method
    
    func getWorkflowsIn(Account id: String, parameters: String) -> [Workflow]? {
        var (data, error) = httpManager.getRequest("'https://www.wrike.com/api/v3/accounts/" + id + "workflows", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getWorkflowsInAccount' - \(error?.localizedDescription)")
        } else {
            return apiManager.getWorkflows(data!)
        }
        
        return nil
    }
    
    // MARK: - FolderTree methods
    
    func getFolderTreeInAllAccounts(parameters: String) -> [FolderTree]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/folders", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getFolderTreeInAllAccounts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolderTree(data!)
        }
        
        return nil
    }
    
    func getFolderTreeInAccountBy(id: String, parameters: String) -> [FolderTree]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/accounts/" + id + "/folders", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getFolderTreeInAccountBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolderTree(data!)
        }
        
        return nil
    }
    
    func getFolderTreeInFoldersBy(id: String, parameters: String) -> [FolderTree]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/folders/" + id + "/folders", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'getFolderTreeInFoldersBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolderTree(data!)
        }
        
        return nil
    }
    
    // MARK: - Folder methods
    
    func getFoldersBy(IDs: [String], parameters: String) -> [Folder]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/folders/" + ",".join(IDs), parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getFoldersBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getFolders(data!)
        }
        
        return nil
    }
    
    func createFolder(parameters: String) -> Folder? {
        //  /api/v3/folders/IEAAALNZI4AC7MZC/folders
        // TODO: - Create post request
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createFolder' - \(error?.localizedDescription)")
        } else {
            return apiManager.createFolder(data!)
        }
        
        return nil
    }
    
    // MARK: - Taksk methods
    
    func getTasksInAllAccounts(parameters: String) -> [Task]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/tasks", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getTasksInAllAccounts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func getTasksInAccountBy(id: String, parameters: String) -> [Task]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/accounts/" + id + "/tasks", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getTasksInAccountBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func getTasksInFolderBy(id: String, parameters: String) -> [Task]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/folders/" + id + "/tasks", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getTasksInFolderBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func getTasksBy(IDs: [String], parameters: String) -> [Task]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/tasks/" + ",".join(IDs), parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getTasksBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getTasks(data!)
        }
        
        return nil
    }
    
    func createTask(parameters: String) -> Task? {
        // /api/v3/folders/IEAAALNZI4AC7MZC/tasks
        // TODO: - Create post request
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createTask' - \(error?.localizedDescription)")
        } else {
            return apiManager.createTask(data!)
        }
        
        return nil
    }
    
    // MARK: - Comment methods
    
    func getCommentsInAllAccounts(parameters: String) -> [Comment]? {
        
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/comments", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getCommentsInAllAccounts' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsInAccountBy(id: String, parameters: String) -> [Comment]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/accounts/" + id + "/comments", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getCommentsInAccountBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsInFolderBy(id: String, parameters: String) -> [Comment]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/folders/" + id + "/comments", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getCommentsInFolderBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsInTaskBy(id: String, parameters: String) -> [Comment]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/tasks/" + id + "/comments", parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getCommentsInTaskBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func getCommentsBy(IDs: [String], parameters: String) -> [Comment]? {
        var (data, error) = httpManager.getRequest("https://www.wrike.com/api/v3/comments/" + ",".join(IDs), parameters: parameters, token: token)
        
        if error != nil {
            println("Error in 'getCommentsBy' - \(error?.localizedDescription)")
        } else {
            return apiManager.getComments(data!)
        }
        
        return nil
    }
    
    func createCommentInFolderBy(id: String, parameters: String) -> Comment? {
        // /api/v3/folders/IEAAALNZI4AC7MZC/comments
        // TODO: - Create post request
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createCommentInFolder' - \(error?.localizedDescription)")
        } else {
            return apiManager.createComment(data!)
        }
        
        return nil
    }
    
    func createCommentInCommentBy(id: String, parameters: String) -> Comment? {
        // /api/v3/tasks/IEAAALNZKQAC7MZH/comments
        // TODO: - Create post request
        var (data, error) = httpManager.postRequest("", parameters: "", token: token)
        
        if error != nil {
            println("Error in 'createCommentInComment' - \(error?.localizedDescription)")
        } else {
            return apiManager.createComment(data!)
        }
        
        return nil
    }
    
    func updateCommentInFolderBy(id: String, parameters: String) -> Comment? {
        // /api/v3/comments/IEAAALNZIMABQ3FJ
        // TODO: - Create put request
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
