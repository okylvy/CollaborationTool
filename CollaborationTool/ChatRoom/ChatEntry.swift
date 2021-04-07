//
//  ChatEntry.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/04/07.
//

import SwiftUI

struct ChatEntry: View {
    @AppStorage("current_user") var user = ""

    var body: some View {
        if user == "" {
            AddChatUserView()
        } else {
            ChatRoom()
        }
    }
}

struct ChatEntry_Previews: PreviewProvider {
    static var previews: some View {
        ChatEntry()
    }
}
