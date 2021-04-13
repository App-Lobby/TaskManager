//
//  AddTaskView.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var taskVM : TaskViewModel
    
    @State var name = ""
    @State var taskName = ""
    @State var date = Date()
    @State var priority : Priority = .normal
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Task")) {
                    TextField("Name ", text : $name)
                    TextField("Task Name ", text : $taskName)
                }
                Section {
                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases) { priority in
                            Label(
                                title: { Text(priority.title) },
                                icon: { Image(systemName: "exclamationmark.circle") })
                                .foregroundColor(priority.color)
                                .tag(priority)
                        }
                    }
                }
                
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                                leading: Button(action:{
                                                presentationMode.wrappedValue.dismiss() },
                                                label : {
                                                    Text("Cancel")
                                                    .foregroundColor(.red)
                                                }),
                                trailing: Button(action:{taskVM.addTask(task: .init(name: name, taskName: taskName, date: date, priority: priority))
                                                    presentationMode.wrappedValue.dismiss()},
                                                   label:{
                                                    Text("Save")
                                                   }).disabled(name.isEmpty || taskName.isEmpty)
            )
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskVM: TaskViewModel())
    }
}
