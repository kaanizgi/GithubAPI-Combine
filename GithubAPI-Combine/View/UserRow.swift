//
//  UserRow.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import SwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        HStack (spacing: 12) {
            AsyncImage(url: URL(string: user.avatarUrl)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "photo.fill")
            }.frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(user.name)
        }
        .padding(4)
        
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockUser = User(id: 1, name: "John Doe", avatarUrl: "")
        UserRow(user: mockUser)
    }
}
