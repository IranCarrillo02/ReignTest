//
//  HomeView.swift
//  ExamReign
//
//  Created by Iran Carrillo Guzman on 6/28/21.
//

import SwiftUI

struct Home: View {
    @StateObject var jsonModel = NetworkingManager()
    @Environment(\.managedObjectContext) var context
    
    //Fetching Data From Core Data
    @FetchRequest(entity: DataBase.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \DataBase.created_at, ascending: true)]) var results : FetchedResults<DataBase>
    
    var body: some View {
        
        VStack{
            //Check if core data exists
            if results.isEmpty{
                if jsonModel.DatasList.hits.isEmpty{
                    ProgressView()
                        .onAppear(perform: {
                            jsonModel.fetchDatas(context: context)
                        })
                } else {
                    List(results){item in
                        CardView(fetchedData: item)
                    }.listStyle(InsetGroupedListStyle())
                }
            } else {
                List{
                    ForEach(results){ item in
                        CardView(fetchedData: item)
                    }.onDelete(perform: deleteDatas)
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle(!results.isEmpty ? "Reign Datas Test" : "Getting Data...")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    do{
                        results.forEach{ (data) in
                            context.delete(data)
                        }
                        try context.save()
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                    jsonModel.DatasList.hits.removeAll()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                })
            }
        }
        
    }
    
    private func deleteDatas(at offsets: IndexSet){
        for offset in offsets{
            let itemName = results[offset]
            context.delete(itemName)
            saveData()
        }
    }
    
    private func saveData(){
        try? self.context.save()
    }
    
}



