//
//  SignInView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    @State var isShowPicker: Bool = false
    @State var countryObject: Country?
    @EnvironmentObject var router: RouterViewModel<RoutesNames>
    @State var txtMobile: String  = ""
    var body: some View {
        ZStack(alignment: .top) {
            Image(.bottomBg)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .screenWidth, maxHeight: .screenHeight)

            VStack {
                Image(.signInTop)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .screenWidth, maxHeight: .screenWidth)
                Spacer()
            }

            ScrollView {
                VStack(alignment: .leading) {
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundStyle(Color.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)

                    HStack {
                        Button {
                            isShowPicker.toggle()
                        } label: {
                            if let countryObject = self.countryObject {
                                Text("\(countryObject.isoCode.getFlag())")
                                    .font(.customfont(.regular, fontSize: 35))
                                Text("+ \(countryObject.phoneCode)")
                                    .font(.customfont(.regular, fontSize: 18))
                                    .foregroundStyle(Color.primaryText)
                            } else {
                                Text("+20")
                                    .font(.customfont(.regular, fontSize: 18))
                                    .foregroundStyle(Color.primaryText)
                            }
                        }
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: 0,maxWidth: .infinity)
                    }
                    Divider()
                        .padding(.bottom)
                    Text("Or connect with social media")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0,maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)


                    ZStack {
                        Text("Continue with google")
                            .roundViewWithAction(backgroundColor: Color.red, minHeight: 60, maxHeight: 60) {
                                //MARK: - Action
                            }
                        Image(.googleLogo)
                            .customizeImage()
                    }
                    .padding(.bottom, 8)
                    ZStack {
                        Text("Continue with Facebook")
                            .roundViewWithAction(backgroundColor: Color.blue, minHeight: 60, maxHeight: 60) {
                                //MARK: - Action
                            }
                        Image(.fbLogo)
                            .customizeImage()
                    }

                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth)
            }
        }
        .onAppear {
            self.countryObject = Country(phoneCode: "20", isoCode: "EG")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerView(country: $countryObject)
        })
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
