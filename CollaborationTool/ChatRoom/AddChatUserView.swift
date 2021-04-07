//
//  AddUserView.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/04/07.
//

import SwiftUI

struct AddChatUserView: View {
    @AppStorage("current_user") var user = ""
    @State var textFieldUser: String = ""
    @State var showHomeView: Bool = false

    var body: some View {
        ZStack {
            if showHomeView {
                ChatRoom()
            }

            VStack {
                HStack {
                    Text("Welcome!")
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding()
                .offset(x: 0, y: -240)

                VStack {
                    HStack {
                        Image(systemName: "person")
                            .font(.title)
                            .foregroundColor(.black)

                        TextField("Enter Username", text: $textFieldUser)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.default)
                            .padding()

                        Button(action: {
                            user = textFieldUser
                            self.showHomeView.toggle()
                        }, label: {
                            Image(systemName: "play.fill")
                                .font(.title2)
                        })
                        .disabled(textFieldUser == "")
                    }
                    .padding()
                }
                .frame(width: 300, height: 70)
                .background(Color.gray.opacity(0.08))
                .cornerRadius(15)
            }
        }
    }
}

struct AddChatUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddChatUserView()
    }
}
