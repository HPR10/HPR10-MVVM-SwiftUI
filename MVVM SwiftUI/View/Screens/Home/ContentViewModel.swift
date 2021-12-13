//
//  ContentViewModel.swift
//  MVVM SwiftUI
//
//  Created by Hugo Pinheiro on 13/12/21.
//

import Foundation
// MARK: - ViewModel

class ContentViewModel: ObservableObject {
    
    //Processed Data ---
   @Published var isFollowing = false
   @Published var userFollowing = String()
    
    var user = User(image: "img", name: "Mikatsu Tanaka", nick: "@katsu", followers: 20500)
    
    init(){
        loadFollwers()
    }
    
    func loadFollwers() {
        self.userFollowing = customizeNumber(value: user.followers)
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }

     func followToogle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollwers()
    }
}
