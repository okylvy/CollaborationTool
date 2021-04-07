//
//  MsgModel.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/04/07.
//

import SwiftUI
import FirebaseFirestoreSwift

struct MsgModel: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var msg: String
    var user: String
    var timeStamp: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case msg
        case user
        case timeStamp
    }
}
