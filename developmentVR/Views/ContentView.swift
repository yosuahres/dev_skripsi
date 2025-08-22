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
    @State private var nums = 0
    
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

                Text("Count: \(nums)")

                Button("incremental test"){
                    nums += 1
                }
                
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
