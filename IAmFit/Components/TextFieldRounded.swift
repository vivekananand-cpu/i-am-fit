//
//  TextFieldRounded.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

struct TextFieldRounded: View {
    var label: String
    @Binding var text: String
    var body: some View {
        VStack {
            TextField(label, text: $text)
                .padding(2)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray),
                    alignment: .bottom
                )
        }
            
    }
}

#Preview {
    TextFieldRounded(label: "Name", text: .constant("Vivek"))
}
