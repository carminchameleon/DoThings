//
//  NoItemsView.swift
//  TodoList
//
//  Created by Eunji Hwang on 29/11/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    let accentColor = Color("AccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your to do list!🤔")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : accentColor)
                            .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : accentColor.opacity(0.7),
                    radius: animate ? 30: 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
