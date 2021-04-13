//
//  MainViewModifier.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import Foundation
import SwiftUI

struct MainViewModifier : ViewModifier {
    
    @ObservedObject var taskVM : TaskViewModel
    
    func body(content : Content) -> some View {
        
        content
            .navigationBarTitle("My Tasks")
            .navigationBarItems(trailing: HStack(spacing:30){
                EditButton()
                    .disabled(taskVM.tasks.isEmpty)
                Button(
                    action : { taskVM.isPresented.toggle()},
                    label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
            })
            .onChange(of: taskVM.sortType, perform: { _ in
                guard !taskVM.tasks.isEmpty else { return }
                withAnimation() {taskVM.sort()}
            })
            .fullScreenCover(isPresented: $taskVM.isPresented, content: {
                AddTaskView(taskVM: taskVM)
            })
    }
    
}

