//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Ahmadreza on 4/12/22.
//

import SwiftUI


enum Tab: Hashable {
    case home
    case cards
    case trades
}

struct ContentView: View {
    
    @State var selectedTab = Tab.home
    
    var body: some View {
        VStack() {
            GeometryReader { proxy in
            CurrentTabPage(selectedTab: $selectedTab)
                    .frame(width: UIScreen.main.bounds.size.width,
                           height: UIScreen.main.bounds.size.height - (CustomTabBar.tabBarHeight + proxy.safeAreaInsets.bottom))
            }
            CustomTabBar(selectedTab: $selectedTab)
               
        }
        .background(Color(.lightGray)) .animation(.default, value: 1)
    }
}

struct CurrentTabPage: View {
    
    @Binding var selectedTab: Tab

    var body: some View {
        switch selectedTab {
        case .home:
            Text("Home")
        case .cards:
            Text("Cards")
        case .trades:
            Text("Trades")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewLayout(.sizeThatFits)
            .previewDevice("iPhone SE")
            .colorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
