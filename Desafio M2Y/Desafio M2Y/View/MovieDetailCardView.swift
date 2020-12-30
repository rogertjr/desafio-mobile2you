//
//  MovieDetailCardView.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 29/12/20.
//

import SwiftUI

struct MovieDetailCardView: View {
    var data : Relacionado
    
    var body: some View {
        HStack(spacing: 20) {
            Image(self.data.image)
                .resizable()
                .frame(width: 70, height: 100)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(self.data.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text(self.data.year)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(self.data.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer(minLength: 0)
        }
    }
}
