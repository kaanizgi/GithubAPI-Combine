//
//  ContentView.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel(service: APIService())
    var body: some View {
        NavigationView {
            if vm.isLoading {
                ProgressView()
            }else {
                List {
                    ForEach(vm.users) { data in
                        UserRow(user: data)
                    }
                }.listStyle(.plain)
                .navigationTitle("Github Users")
            }
        }.onAppear {
            vm.getUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
