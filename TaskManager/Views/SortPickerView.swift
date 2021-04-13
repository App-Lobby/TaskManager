//
//  SortPickerView.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import SwiftUI

struct SortPickerView: View {
    
    @ObservedObject var taskVM : TaskViewModel
    
    var body: some View {
        Picker("", selection: $taskVM.sortType) {
            ForEach(SortType.allCases){
                Text($0.rawValue.capitalized)
                    .tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct SortPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SortPickerView(taskVM: TaskViewModel())
    }
}
