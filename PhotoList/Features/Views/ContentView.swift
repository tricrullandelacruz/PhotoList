//
//  ContentView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build()
                .navigationDestination(for: PhotoCoordinator.self) { coordinator in
                    coordinator.build()
                }
        }
        .environmentObject(appCoordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
