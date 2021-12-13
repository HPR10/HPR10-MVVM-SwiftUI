//
//  ContentView.swift
//  MVVM SwiftUI
//
//  Created by Hugo Pinheiro on 13/12/21.
//

import SwiftUI
// MARK: - View

struct ContentView: View {
    @EnvironmentObject var viewModel : ContentViewModel
    
    var body: some View {
        
        VStack {
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isFollowing)
    }
}

struct ProfileDataView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        Image(viewModel.user.image)
            .resizable()
            .frame(width: 200, height: 200)
            .padding(.bottom, 10)
        
        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        Text(viewModel.userFollowing)
            .font(.system(size: 50, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ActionView : View {
    @EnvironmentObject var viewModel: ContentViewModel
    var body: some View {
        VStack {
            Button{(viewModel.followToogle())} label: {
                Label(!viewModel.isFollowing ? "follow" : "unfollow", systemImage: "person.badge.plus")
                    .font(.title3)
                    .frame(width: 330, height: 25)
            }
            // métodos do iOS 15
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : . black)
            
            Button{} label: {
                Label("Enviar Mensagem", systemImage: "envelope")
                    .font(.title3)
                    .frame(width: 330, height: 25)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

// MARK: - Vizualização rápida
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ContentViewModel())
    }
}
