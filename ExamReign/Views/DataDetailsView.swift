//
//  DataDetailsView.swift
//  ExamReign
//
//  Created by Iran Carrillo Guzman on 6/28/21.
//

import SwiftUI
import Foundation
import WebKit

struct DatasDetailView: UIViewRepresentable {

    var data: DataBase
    
    func makeUIView(context: Context) -> WKWebView {
        var urlRaw : String
        if(data.story_url == nil){
            urlRaw = "https://www.reign.cl"
        } else {
            urlRaw = data.story_url!
        }
        
        guard let url = URL(string: urlRaw) else{
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
