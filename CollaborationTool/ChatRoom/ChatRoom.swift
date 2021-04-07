//
//  HomeView.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/04/07.
//

import SwiftUI

struct ChatRoom: View {
    @StateObject var homeModel = HomeModel()
    @AppStorage("current_user") var user = ""
    @State var scrolled = false

    var body: some View {
        VStack {
            HStack {
                Text("Chat")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding()
            .padding(.top)

            ScrollViewReader { reader in
                ScrollView {
                    VStack {
                        ForEach(homeModel.msgs) { msg in
                            ChatRow(chatData: msg)
                                .padding(.bottom, 15)
                                .padding(.top, 10)
                                .onAppear {
                                    if msg.id == self.homeModel.msgs.last!.id && !scrolled {
                                        reader.scrollTo(homeModel.msgs.last!.id, anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        .onChange(of: homeModel.msgs, perform: { value in
                            reader.scrollTo(homeModel.msgs.last!.id, anchor: .bottom)
                        })
                    }
                    .padding(.vertical)
                }
            }
            HStack {
                TextField("Enter Message", text: $homeModel.text)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.blue.opacity(0.06))
                    .clipShape(Capsule())

                if homeModel.text != "" {
                    Button(action: {
                        homeModel.writeMsg()
                    }, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.blue)
                            .clipShape(Circle())
                    })
                }
            }
            .animation(.default)
            .padding()

            // TODO: Remove this dummy field. This is the workaround solotion to avoid hiding text field by tag icon.       
            Text("Dummy text field")
                .padding(30)
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ChatRow: View {
    @AppStorage("current_user") var user = ""
    var chatData: MsgModel

    var body: some View {
        HStack {
            if chatData.user != user {
                Name(name: chatData.user)
                    .offset(x: 0, y: -39)
            }

            if chatData.user == user { Spacer() }

            VStack(alignment: chatData.user == user ? .trailing : .leading, spacing: 5,
                content: {
                    Text(chatData.msg)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(chatData.user == user ? Color.blue : Color.gray)
                        .clipShape(ChatBubble(myMsg: chatData.user == user))

                    Text(chatData.timeStamp, style: .time)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(chatData.user != user ? .leading : .trailing, 10)
                })
            if chatData.user != user { Spacer() }
        }
        .padding(.horizontal)
        .id(chatData.id)
    }
}

struct Name: View {
    @AppStorage("current_user") var user = ""
    var name: String

    var body: some View {
        Text(String(name.first!))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(width: 25, height: 25)
            .background(name == user ? Color.green : Color.blue)
            .clipShape(Circle())
    }
}

struct ChatBubble: Shape {
    var myMsg: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight, myMsg ? .topLeft : .topRight],
                                cornerRadii: CGSize(width: 15, height: 10))

        return Path(path.cgPath)
    }
}

struct ChatRoom_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoom()
    }
}
