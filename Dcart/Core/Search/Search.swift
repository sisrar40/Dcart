//
//  Search.swift
//  Dcart
//
//  Created by sisrar on 15/03/24.
//

import SwiftUI

struct Search: View {
    @State private var searchVideo:String=""
    var videos: [Video] = VideoList.topTen
    
    var filteredVideos: [Video] {
            if searchVideo.isEmpty {
                return videos
            } else {
                return videos.filter { $0.title.localizedCaseInsensitiveContains(searchVideo) }
            }
        }
    
    var body: some View {
        NavigationStack{
            TextField("Search", text: $searchVideo)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(UIColor.systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                )
                
                .padding()
            List(filteredVideos, id: \.id){ video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    HStack{
                        AsyncImage(url: video.imageURL) { image in
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 70)
                                                        .cornerRadius(10)
                                                } placeholder: {
                                                    ProgressView() // Placeholder while loading
                                                }
                        VStack(alignment: .leading, content: {
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                        })
                        
                        
                        
                    }
                })
               
            }
            
        }
        
        
        
    }
}

#Preview {
    Search()
}
