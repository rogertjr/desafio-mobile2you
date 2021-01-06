//
//  MovieDetailCardView.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 29/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailCardView: View {
    // MARK: - PROPERTIES
    var data : Movie
    
    // MARK: - BODY
    var body: some View {
        
        HStack(spacing: 20) {
            AnimatedImage(url: self.data.poster.map {MovieService.imageBase.appendingPathComponent($0)})
                .resizable()
                .frame(width: 70, height: 100)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(self.data.title)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
                HStack {
                    Text(self.data.date.onlyYear ?? "")
                        .font(.caption)
                        .foregroundColor(.yellow)
                    
                    Text("Genre")
                        .font(.caption)
                        .foregroundColor(.gray)
                } //: HSTACK
            } //: VSTACK
            
            Spacer(minLength: 0)
        } //: HSTACK
    }
    
}

// MARK: - EXTENSION / UTILITIES
extension String {
    var onlyYear: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
