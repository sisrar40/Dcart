//
//  VideoDetailView.swift
//  Dcart
//
//  Created by sisrar on 15/03/24.
//

import SwiftUI

struct VideoDetailView: View {
    var video: Video
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            if let videoID = extractYouTubeVideoID(from: video.url.absoluteString) {
                            YouTubePlayerView(videoID: videoID)
                                .frame(height: 200)
                                .padding()
                                .cornerRadius(24)
                        } else {
                            Text("Invalid YouTube URL")
                        }
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                
            HStack(spacing: 40) {
                Label("\(video.viewCount)", systemImage: "eye.fill")
                Text(video.uploadDate)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action: {
                if let url = URL(string: video.url.absoluteString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Watch now")
                    .bold()
                    .font(.title2)
                    .frame(width: 270, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
        }
    }
    
    func extractYouTubeVideoID(from url: String) -> String? {
        if url.hasPrefix("https://youtu.be/") {
            let components = url.components(separatedBy: "/")
            if let videoID = components.last {
                return videoID
            }
        }
        return nil
    }
}


#Preview {
    VideoDetailView(video: VideoList.topTen.first!)
}
