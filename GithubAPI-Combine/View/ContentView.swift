//
//  ContentView.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.users) { data in
                    UserRow(user: data)
                }
            }.listStyle(.plain)
            .navigationTitle("Github Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
