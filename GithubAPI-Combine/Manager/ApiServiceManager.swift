//
//  ApiServiceManager.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 9.01.2023.
//

import Foundation
import Combine


protocol ApiServiceManager {
    func getUsers(Endpoint:Endpoint) -> AnyPublisher<[User],Error>
}


