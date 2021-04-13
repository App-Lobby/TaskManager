//
//  KeyBoardExtension.swift
//  TaskManager
//
//  Created by Mohammad Yasir on 13/04/21.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

