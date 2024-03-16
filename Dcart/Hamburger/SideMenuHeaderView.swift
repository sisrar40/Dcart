//
//  SideMenuHeaderView.swift
//  Dcart
//
//  Created by sisrar on 13/03/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circel.fill")
                .imageScale(.large)
                .foregroundColor(.white)
                .frame(width: 48,height: 48)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Shaikh Israr")
                    .font(.subheadline)
                Text("sirar40@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
        
    }
}

#Preview {
    SideMenuHeaderView()
}
