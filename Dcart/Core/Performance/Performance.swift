//
//  Performance.swift
//  Dcart
//
//  Created by sisrar on 15/03/24.
//

import SwiftUI

struct Performance: View {
    @State var currentDate = Date()
    @State var TextInput : String = ""
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE, MMMM dd"
           return formatter
       }()
    
    
    var body: some View {
        VStack{
                HStack(spacing:40){
                    Button(action: {
                        self.currentDate = Calendar.current.date(byAdding: .day, value: -1, to: self.currentDate) ?? Date()
                    }, label: {
                        Image(systemName: "chevron.left")
                                            .frame(width: 40, height: 40)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(40)
                    })
                    VStack{
                        Text(dateFormatter.string(from: currentDate))
                            .font(.headline)
                            .fontWeight(.thin)
                        Text("This Week")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Button(action: {
                        self.currentDate = Calendar.current.date(byAdding: .day, value: 1, to: self.currentDate) ?? Date()
                    }) {
                                    Image(systemName: "chevron.right")
                                        .frame(width: 40, height: 40)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(40)
                                }
                }
            
            
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(1..<5){item in
                        Rectangle()
                             .frame(width: 180, height: 150)
                             .cornerRadius(10)
                    }
                   
                }
            }.padding()
            
            HStack(spacing: 20, content: {
                TextField("Search", text: $TextInput)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(4)
                    .shadow(radius: 3)
                Button(action: {
                    print(TextInput)
                }, label: {
                    Image(systemName: "magnifyingglass")
                                    .foregroundColor(.blue)
                                    .font(.subheadline)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)                 })
            })
           
                
            
            
            
            .padding()
            Spacer()
        }
    }
    
    
  
}

#Preview {
    Performance()
}
