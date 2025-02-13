//
//  HomeView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: RouterViewModel<RoutesNames>
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack {
            // background layer
            Color(.background)
                .ignoresSafeArea()
            // content layer
            VStack {
                homeHeader

                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
        .task {
            await vm.fetchMarketsCoins()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio
                             ? "plus" : "info")
            .animation(.none,value: showPortfolio)
            .background(
                CircleButtonAnimationView(animate: $showPortfolio)

            )
            Spacer()
            Text(showPortfolio ? "Portfolio" :  "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.accentColor)
                .animation(.none,value: 0)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }

    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) {
                coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.allCoins) {
                coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.secondaryText)
        .padding(.horizontal)
    }
}
