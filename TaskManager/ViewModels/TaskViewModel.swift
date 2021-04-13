//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import Foundation

class TaskViewModel : Identifiable , ObservableObject {
    
    @Published var tasks : [Task] = [
        Task(name: "Publish An Article", taskName: "@Medium", date: Date(timeIntervalSinceReferenceDate:1619231231.0), priority: .normal),
        Task(name: "Buy Some Foods", taskName: "BBinstant", date: Date(timeIntervalSinceReferenceDate:1621231231.0), priority: .high),
        Task(name: "Launch the App", taskName: "App Store", date: Date(), priority: .medium),
        Task(name: "Walk Around", taskName: "Garden", date: Date(), priority: .normal)
    ]
    
    @Published var sortType : SortType = .alphabetical
    @Published var isPresented = false
    @Published var searched = ""
    
    func addTask(task : Task){
        tasks.append(task)
    }
    
    func removeTask(indexAt : IndexSet){
        tasks.remove(atOffsets: indexAt)
    }
    
    func sort(){
        
        switch sortType {
        case .alphabetical :
            tasks.sort(by: { $0.name < $1.name })
        case .date :
            tasks.sort(by: { $0.date > $1.date })
        case .priority :
            tasks.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
    
}

