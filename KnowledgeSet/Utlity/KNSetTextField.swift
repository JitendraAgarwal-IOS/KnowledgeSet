//
//  KNSetTextField.swift
//  KnowledgeSet
//
//  Created by Capgemini on 06/11/20.
//

import SwiftUI

struct KNSetTextField<TextFieldView>: View where TextFieldView: View  {
    
    @Binding var text: String
    let textFieldView: TextFieldView
    let placeholder: String
    var imageName: String? = nil
    
    var body: some View {
        KNSetTextField
    }
    
}

extension KNSetTextField {
    private var imageIconeView : some View {
        Image(imageName ?? "")
            .frame(width: 32, height: 32)
            .padding(.leading , 16)
            .padding(.trailing, 16)
    }
    private var KNSetTextField : some View {
        VStack {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    placeHolderView
                }
                textFieldView
            }
            underlineView
        }
        
    }
    
    private var placeHolderView : some View {
        Text(placeholder)
            .foregroundColor(.gray)
            .padding(.trailing, 16)
        
    }
    private var underlineView: some View {
        Rectangle()
            .fill(self.text == "" ? Color.gray : Color.blue)
            .frame(height: 1)
            .padding(.trailing, 16)
        
    }
    
}




