//
//  DataAPIResponse.swift
//  ExamReign
//
//  Created by Iran Carrillo Guzman on 6/28/21.
//

import Foundation


struct DatasAPIResponse : Decodable {
   
    var hits: [DatasListEntry]
        
}

struct DatasListEntry: Decodable {
    let created_at: String
    let author: String
    let comment_text: String?
    let story_title: String?
    let story_url: String?
    
}
