//
//  ContentView.swift
//  Push Notification POC
//
//

import SwiftUI

struct ContentView: View {
    
    @State var navigateTpPushNotificationPage = false
    
    @State var rootPage = 0
    
    var body: some View {
        NavigationView {
            VStack {
                switch rootPage {
                case 0:
                    ScreenA()
                case 1:
                    ScreenB()
                case 2:
                    ScreenC()
                default:
                    ScreenA()
                }
                
                NavigationLink(destination: ScreenFromPuah(), isActive: $navigateTpPushNotificationPage, label: {
                    EmptyView()
                })
                .hidden()
            }
            .padding()
            .onAppear {
                NotificationCenter.default.addObserver(forName: Notification.Name("NavigateToScreen"), object: nil, queue: .main) { notification in
                    navigateTpPushNotificationPage = true
                    
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}



struct ScreenA: View {
    var body: some View {
        NavigationLink(destination: ScreenB()) {
            Text("Open Screen B")
        }
    }
}

struct ScreenB: View {
    var body: some View {
        NavigationLink(destination: ScreenC()) {
            Text("Open Screen C")
        }
    }
}

struct ScreenC: View {
    var body: some View {
        Text("Open Screen C")
    }
}

struct ScreenFromPuah: View {
    var body: some View {
        Text("Opened From Push")
    }
}

#Preview {
    ContentView()
}
