//
//  TaskView.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import SwiftUI

struct TaskView: View {
    
    var task : Task
    
    var body: some View {
        VStack (alignment : .leading){
            HStack{
                VStack(alignment:.leading) {
                    Text("Name:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(task.name)
                        .font(.system(size: 20, weight: .bold))
                }
                Spacer()
                VStack (alignment:.leading){
                    Text("Date:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(task.date , style: .date)
                }
            }
            Text("Task:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(task.taskName)
                .font(.system(size: 15, weight: .bold))
                .italic()
        }
        .padding(10)
        .background(
            task.priority.color.opacity(0.2))
        .cornerRadius(10)
        .background(
            RoundedRectangle(cornerRadius: 10 , style: .continuous)
                .stroke(task.priority.color , lineWidth: 0.7)
                .shadow(color: task.priority.color, radius: 0.7))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: Task(id: "", name: "Name", taskName: "Task Name", date: Date(), priority: .normal))
    }
}
