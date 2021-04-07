//
//  ContentView.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/03/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()

            TabView {
                TodoList()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("TODO")
                }
                Shopping()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Buy")
                }
                ChatEntry()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Chat")
                }
                Setting()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Setting")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
