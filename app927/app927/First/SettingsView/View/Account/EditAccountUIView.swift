//
//  EditAccountUIView.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI

struct EditAccountUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @Binding var account: Account
    @State var name = ""
    @State var age = ""
    @State var gender = ""
    @State var description = ""
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
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
                        
                        
                    }.foregroundColor(.red)
                    
                    HStack {
                        Spacer()
                        Text("Account")
                            .foregroundColor(.white)
                            .bold()
                        
                        Spacer()
                    }
                }
                
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .scaledToFill()
                        .clipShape(Circle())
                        .onTapGesture {
                            isShowingImagePicker = true
                        }
                    
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
                        .onTapGesture {
                            isShowingImagePicker = true
                        }
                    
                }
                
                Text("Select a photo")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .onTapGesture {
                        isShowingImagePicker = true
                    }
                
                ZStack(alignment: .leading) {
                    if name.isEmpty {
                        Text("Name")
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                    }
                    TextField("", text: $name)
                        .foregroundColor(.white.opacity(0.3))
                        .font(.system(size: 15, weight: .semibold))
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(10)
                }
                
                ZStack(alignment: .leading) {
                    if age.isEmpty {
                        Text("Age")
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                    }
                    TextField("", text: $age)
                        .foregroundColor(.white.opacity(0.3))
                        .font(.system(size: 15, weight: .semibold))
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(10)
                }
                
                
                ZStack(alignment: .leading) {
                    if gender.isEmpty {
                        Text("Gender")
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                    }
                    TextField("", text: $gender)
                        .foregroundColor(.white.opacity(0.3))
                        .font(.system(size: 15, weight: .semibold))
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(10)
                }
                
                ZStack(alignment: .leading) {
                    if description.isEmpty {
                        Text("Position")
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                    }
                    TextField("", text: $description)
                        .foregroundColor(.white.opacity(0.3))
                        .font(.system(size: 15, weight: .semibold))
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(10)
                }
                
                
               
                
                Spacer()
                
                Button {
                    if !name.isEmpty && !age.isEmpty && !gender.isEmpty && !description.isEmpty {
                        if let image = selectedImage {
                            let account = Account(imageData: image.jpegData(compressionQuality: 1.0), name: name, age: age, gender: gender, position: description)
                            viewModel.updateAccount(account: account)
                        } else {
                            let account = Account(name: name, age: age, gender: gender, position: description)
                            viewModel.updateAccount(account: account)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .cornerRadius(16)
                            .foregroundColor((!name.isEmpty && !age.isEmpty && !gender.isEmpty && !description.isEmpty) ? .redBtn : .white.opacity(0.5))
                        Text("Save")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }
                
            }.padding(.horizontal)
                .navigationBarBackButtonHidden()
                .onAppear() {
                    selectedImage = account.image
                    name = account.name
                    age = account.age
                    gender = account.gender
                    description = account.position
                }
        }.sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
    }
        
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
}


#Preview {
    EditAccountUIView(viewModel: SettingsViewModel(), account: .constant(Account(imageData: UIImage(named: "notifications920")?.jpegData(compressionQuality: 1.0), name: "Nina", age: "52 Age", gender: "Female", position: "I love to travel")))
}
