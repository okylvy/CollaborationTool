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

            // TODO button
            Button(action: {
                
            }) {
                Text("TODO!!")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()

            // Shopping button
            Button(action: {
                
            }) {
                Text("Shopping")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()

            // Chat button
            Button(action: {
                
            }) {
                Text("Chat")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()

            // Routine button
            Button(action: {
                
            }) {
                Text("Routine")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
