//
//  ContentView.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var taskVM = TaskViewModel()
    
    @State var searched = ""
    
    var body: some View {
            NavigationView{
                VStack{
                    TaskSearchView(taskVM: taskVM)
                    SortPickerView(taskVM : taskVM)
                    TaskListView(taskVM : taskVM)
                }
                .modifier(MainViewModifier(taskVM : taskVM))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
