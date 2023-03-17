//
//  ViewModel.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation
import Combine

class ViewModel:ObservableObject {
    
    let service:ApiServiceManager
    
    @Published var users = [User]()
    @Published var isLoading = false
    
    private var cancellable:AnyCancellable?
    
    init(service:ApiServiceManager) {
        self.service = service
    }
    
    func getUsers() {
        isLoading = true
        cancellable = service.getUsers(Endpoint: .users)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { userData in
                self.users = userData
            })
    }
    
    
    
}
