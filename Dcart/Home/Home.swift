import SwiftUI

struct Home: View {
    @State private var showMenu = false
    @State private var selectedTab = 1
    @State private var title: String = "Dashboard"
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    Text("Dashboard")
                        .tag(0)
                    Performance()
                        .tag(1)
                    Text("Profile")
                        .tag(2)
                    Search()
                        .tag(3)
                    Text("Notification")
                        .tag(4)
                }
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width > 100 {
                                showMenu.toggle()
                            }
                        }
                )
                
                if showMenu {
                    SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                }
            }
            .toolbar(showMenu ? .hidden : .visible,for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(title, displayMode: .inline)
            
            .onChange(of: selectedTab) { newValue in
                switch newValue {
                case 0:
                    title = "Dashboard"
                case 1:
                    title = "Performance"
                case 2:
                    title = "Profile"
                case 3:
                    title = "Search"
                case 4:
                    title = "Notification"
                default:
                    title = "Unknown"
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
