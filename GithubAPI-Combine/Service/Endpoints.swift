//
//  Endpoints.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 9.01.2023.
//

import Foundation

enum Endpoint: String {
    private var baseURL: String { return "https://api.github.com" }

    case users = "/users"
   
    var url: URL {
        guard let url = URL(string: baseURL) else {
            preconditionFailure("Error")
        }
        return url.appendingPathComponent(self.rawValue)
    }
}
