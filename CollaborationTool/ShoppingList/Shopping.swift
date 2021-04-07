//
//  Shopping.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/03/20.
//

import SwiftUI

struct Shopping: View {
    @State var shoppingList:[String] = []
    @State var shopping = ""

    var body: some View {
        VStack {
            // Shopping list.
            List {
                Section(header: Text("Shopping")){
                    ForEach(shoppingList, id: \.self) {
                        user in Text(user)
                    }
                }
            }
            .listStyle(PlainListStyle())

            // Input field to add stuff to buy.
            HStack {
                 TextField("Add shopping", text: $shopping)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .padding()
                 Button(action: {
                     self.shoppingList.append(self.shopping)
                     self.shopping = ""
                 }) {
                     Text("Add")
                     .padding()
                 }
            }
        }    }
}

struct Shopping_Previews: PreviewProvider {
    static var previews: some View {
        Shopping()
    }
}
