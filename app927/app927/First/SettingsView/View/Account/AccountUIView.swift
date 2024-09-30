//
//  AccountUIView.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI

struct AccountUIView: View {
    @State var account: Account
    @ObservedObject var viewModel: SettingsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 12) {
                ZStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack(spacing: 2){
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                        }
                        Spacer()
                        NavigationLink {
                            EditAccountUIView(viewModel: viewModel, account: $account).navigationBarBackButtonHidden()
                        } label: {
                            Text("Edit")
                        }
                        
                        
                    }.foregroundColor(.red)
                    
                    HStack {
                        Spacer()
                        Text("Account")
                            .foregroundColor(.white)
                            .bold()
                        
                        Spacer()
                    }
                }
                
                
                if let image = account.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                    
                    
                } else {
                    Image(systemName: "person.fill")
                        .font(.system(size: 90))
                        .foregroundColor(.red)
                        .padding(.top)
                        .background(Color.white.opacity(0.5)).clipShape(Circle())
                        .padding(30)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        )
                    
                }
                
                Text(account.name)
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                
                
                HStack {
                    Text(account.age)
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                
                
                
                HStack {
                    Text(account.gender)
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                
                
                HStack {
                    Text(account.position)
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                
                
               
                
                Spacer()
                
            }.padding(.horizontal)
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AccountUIView(account: Account(imageData: UIImage(named: "notifications920")?.jpegData(compressionQuality: 1.0), name: "Nina", age: "52 Age", gender: "Female", position: "I love to travel"), viewModel: SettingsViewModel())
}
