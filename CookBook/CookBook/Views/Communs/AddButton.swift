//
//  AddButton.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Button (action: {}){
            Image("Icons/plus").background(Color("VERT")).clipShape(Circle())
        }
    }
}

#Preview {
    AddButton()
}
