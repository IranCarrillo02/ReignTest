//
//  CardView.swift
//  ExamReign
//
//  Created by Iran Carrillo Guzman on 6/28/21.
//

import SwiftUI

struct CardView: View {
    var fetchedData: DataBase?
    var body: some View {
        
       NavigationLink(destination: DatasDetailView(data: fetchedData!), label:{
            HStack{
                
                Image("reign_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                
                VStack(alignment: .leading, spacing: 5){
                    
                    if fetchedData!.story_title != nil {
                        Text(fetchedData!.story_title!)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                    }else{
                        Text("Title Unknown")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                    }
                    
                    
                    
                    Text(fetchedData!.author!)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        + Text(" - ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        + Text(fetchedData!.created_at!.prefix(10))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        })
    }
}



