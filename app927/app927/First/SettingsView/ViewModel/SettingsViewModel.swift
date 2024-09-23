//
//  SettingsViewModel.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI
import StoreKit

class SettingsViewModel: ObservableObject {
    @Published var account = Account(name: "Username", age: "Age", gender: "Gender", position: "Description") {
        didSet {
            saveAttractions()
        }
    }
    
    private let attractionsFileName = "account.json"

    init() {
        loadAttractions()
    }
    let standardNavBarHeight = UIScreen.main.bounds.height / 5.5
    
    func updateAccount(account: Account) {
        self.account = account
        
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func attractionsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(attractionsFileName)
    }
    
   
    
    private func saveAttractions() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.account)
                try data.write(to: self.attractionsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadAttractions() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: attractionsFilePath())
            account = try decoder.decode(Account.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    
    func shareApp() {
        guard let url = URL(string: "https://apps.apple.com/app/aviator-guide/id6708240832") else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    func openUsagePolicy() {
        guard let url = URL(string: Info().usagePolicy) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
