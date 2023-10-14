//
//  CircularMotion.swift
//  SwiftUIAnimation
//
//  Created by Rohit Ragmahale on 14/10/23.
//

import SwiftUI
struct CircleWithAnimatableAngle: Shape {
    var radius: Float = 150
    var angle: Float = Float.pi / 2
    var animatableData: Float {
        get { angle }
        set { angle = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path({ path in
            let x  = CGFloat(400 + radius * cos(angle))
            let y  = CGFloat(400 - radius * sin(angle))
            path.move(to: CGPoint(x: x, y: y))
            path.addEllipse(in: CGRect(x: x - 25.0, y: y - 25.0, width: 50, height: 50))
            
        })
    }
}

struct CircleAnimation: ViewModifier, Animatable {
    var angle: Float
    var radius: Float

    var animatableData: Float {
        get { angle }
        set {
            angle = newValue
        }
    }

    func body(content: Content) -> some View {
        let x = CGFloat(400 + radius * cos(angle))
        let y = CGFloat(400 - radius * sin(angle))
        content.position(x: x, y: y)
    }
}

struct CircularMotion: View {
    @State var xpos: CGFloat = 400
    @State var ypos: CGFloat = 200
    
    @State var angle: Float = 0
    let radius: Float = 150
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(.black, lineWidth: 2)
                .foregroundColor(.clear)
                .frame(width: CGFloat(2*radius), height: CGFloat(2*radius))
                .position(x: 400, y: 400)
            
            //CircleWithAnimatableAngle(radius: radius, angle: angle)
            //  .foregroundColor(.pink)
            
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                Text("Hello!")
                    .offset(x: 80)
                    .font(.system(size: 24))
            }
            .modifier(CircleAnimation(angle: angle, radius: radius))
        }
        .frame(width: 800, height: 800)
        .background(.yellow)
        .onAppear {
            withAnimation(.easeInOut(duration: 2)) {
                angle = (2 * Float.pi)
            }
        }
    }
}

#Preview {
    CircularMotion()
}


