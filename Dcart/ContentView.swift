import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var navigationActive: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Spacer()
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 200, height: 200)
                    .overlay(
                        Text("Betting")
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .padding()
                
                
                TextField("Username", text: $username)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(UIColor.systemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                    )
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(UIColor.systemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    if username.isEmpty || password.isEmpty {
                        showAlert = true
                        alertMessage = "Please enter both username and password."
                    } else {
                        
                        navigationActive = true
                    }
                }) {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.title3)
                }
                .padding()
                Spacer()
Spacer()
            }
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Result"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $navigationActive) {
                Home()
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
