    //
    //  SplashView.swift
    //  MTrack
    //
    //  Created by Devolper.Scorpio on 03/03/2022.
    //  Copyright © 2022 Developer.Scorpio. All rights reserved.
    //


import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack{
            if self.isActive{
                ContentView()
            }else{
                splash
            }
        }.edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
    }
        //MARK: - Splash View
    var splash : some View{
        VStack{
            Text("MTrack")
                .foregroundColor(.red)
                .font(Font.system(size:30, design: .default).bold())
                //.fontWeight(.bold)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
