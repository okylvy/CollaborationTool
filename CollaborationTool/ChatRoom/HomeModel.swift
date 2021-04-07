//
//  ChatRoom.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/03/20.
//

import SwiftUI
import Firebase

class HomeModel: ObservableObject {
    @Published var text = ""
    @Published var msgs: [MsgModel] = []
    @AppStorage("current_user") var user = ""

    let ref = Firestore.firestore()

    init() {
        readAllMsgs()
    }

    func readAllMsgs() {
        ref.collection("Msgs").order(by: "timeStamp", descending: false).addSnapshotListener { (snap, err) in
            if err != nil {
                print(err!.localizedDescription)

                return
            }

            guard let data = snap else { return }

            data.documentChanges.forEach { (doc) in
                if doc.type == .added {
                    let msg = try! doc.document.data(as: MsgModel.self)!

                    DispatchQueue.main.async {
                        self.msgs.append(msg)
                    }
                }
            }
        }
    }

    func writeMsg() {
        let msg = MsgModel(msg: text, user: user, timeStamp: Date())
        let _ = try! ref.collection("Msgs").addDocument(from: msg) { (err) in
            if err != nil {
                print(err!.localizedDescription)

                return
            }
        }
    }
}
