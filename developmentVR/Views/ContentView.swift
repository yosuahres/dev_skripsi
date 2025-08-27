//
//  ContentView.swift
//  developmentVR
//
//  Created by HARES on 8/19/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("item")
            }
            .navigationTitle("Sidebar")
        } detail: {
         
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Jancuk")
                
                ToggleImmersiveSpaceButton()
            }
            .navigationTitle("Content")
            .padding()
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
