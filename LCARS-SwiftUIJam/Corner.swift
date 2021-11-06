//
//  Corner.swift
//  LCARS-SwiftUIJam
//
//  Created by Sebastien Boisvert on 2021-11-05.
//

import SwiftUI

struct Corner: View {

    public enum Orientation  {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }

    var effectiveWidth : Double = 100 // the width of the of the side
    var bannerHeight : Double = 50 // the height of the banner
    // the final height/width will be more because we render the visual size

    var color : Color = .orange
    var orientation : Orientation = .topLeft

    // there's probably a better way of encoding this in the enum?
    private func scaleValues() -> (Double,Double) {
        switch orientation {
            case .topLeft:
                return (1.0, 1.0)
            case .topRight:
                return (-1.0, 1.0)
            case .bottomLeft:
                return (1.0, -1.0)
            default:
                return (-1.0, -1.0)
        }
    }

    var body: some View {
        Path { path in
            path.addArc(center: CGPoint(x: effectiveWidth / 2, y: bannerHeight * 2), radius: bannerHeight * 2 , startAngle: Angle(degrees: 180), endAngle: Angle(degrees:270), clockwise: false)
            path.addLine(to: CGPoint(x: effectiveWidth, y: 0.0))
            path.addLine(to: CGPoint(x: effectiveWidth, y: bannerHeight  ))
            path.addArc(center: CGPoint(x: effectiveWidth, y: bannerHeight * 2), radius: bannerHeight / 2, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 180), clockwise: true)

            path.closeSubpath()
        }
        .transform(CGAffineTransform(scaleX: scaleValues().0, y: scaleValues().1))
        .fill(color)
        // TODO: adjust true size based on rendered layout (will be larger)
        .frame(width: effectiveWidth, height: bannerHeight)
    }
}

struct Corner_Previews: PreviewProvider {
    static var previews: some View {
        Corner(effectiveWidth: 150, bannerHeight: 25, color: .orange, orientation: .topLeft)
    }
}
