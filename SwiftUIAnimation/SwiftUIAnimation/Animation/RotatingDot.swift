//
//  RotatingDot.swift
//  SwiftUIAnimation
//
//  Created by Rohit Ragmahale on 14/10/23.
//

import SwiftUI

struct RotatingDot: View {
    @State private var startAnimation = false
        @State private var duration = 1.0 // Works as speed, since it repeats forever
        
        var body: some View {
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.red.opacity(0.5))
                    .frame(width: 156, height: 156, alignment: .center)
                Circle()
                    .fill(.blue)
                    .frame(width: 28, height: 28, alignment: .center)
                    .offset(x: 120)
                    .rotationEffect(.degrees(startAnimation ? 360 : 0))
                    .animation(.linear(duration: 3.0).repeatForever(autoreverses: false),
                               value: startAnimation
                    )
                
                Circle()
                    .fill(.orange)
                    .frame(width: 18, height: 18, alignment: .center)
                    .offset(x: 90)
                    .rotationEffect(.degrees(startAnimation ? 90 : 0))
                    .animation(.linear(duration: duration).repeatForever(autoreverses: true),
                               value: startAnimation
                    )
                
                Circle()
                    .fill(.red)
                    .frame(width: 18, height: 18, alignment: .center)
                    .offset(x: 90)
                    .rotationEffect(.degrees(startAnimation ? 90 : 180))
                    .animation(.linear(duration: duration).repeatForever(autoreverses: true),
                               value: startAnimation
                    )
                Circle()
                    .fill(.green)
                    .frame(width: 18, height: 18, alignment: .center)
                    .offset(x: 90)
                    .rotationEffect(.degrees(startAnimation ? 270 : 180))
                    .animation(.linear(duration: duration).repeatForever(autoreverses: true),
                               value: startAnimation
                    )
                Circle()
                    .fill(.yellow)
                    .frame(width: 18, height: 18, alignment: .center)
                    .offset(x: 90)
                    .rotationEffect(.degrees(startAnimation ? 270 : 360))
                    .animation(.linear(duration: duration).repeatForever(autoreverses: true),
                               value: startAnimation
                    )
            }
            .onAppear {
                self.startAnimation.toggle()
            }
        }
}

#Preview {
    RotatingDot()
}
