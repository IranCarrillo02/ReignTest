//
//  NetworkingManager.swift
//  ExamReign
//
//  Created by Iran Carrillo Guzman on 6/28/21.
//


import Foundation
import SwiftUI
import CoreData

class NetworkingManager : ObservableObject {
    
    var DatasList = DatasAPIResponse(hits: [])
    
    //saving JSON TO Core Data
    
    func saveData(context: NSManagedObjectContext){
        
        DatasList.hits.forEach { (data) in
            
            let entity = DataBase(context: context)
            entity.author = data.author
            entity.comment_text = data.comment_text
            entity.created_at = data.created_at
            entity.story_title = data.story_title
            entity.story_url = data.story_url
        }
        
        do{
            try context.save()
            print("success")
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func fetchDatas(context: NSManagedObjectContext) {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search_by_date?query=mobile") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let DatasList = try! JSONDecoder().decode(DatasAPIResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.DatasList = DatasList
                
                self.saveData(context: context)
            }
        }.resume()
    }
}

