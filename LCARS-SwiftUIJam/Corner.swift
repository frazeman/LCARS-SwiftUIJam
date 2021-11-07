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

    var columnWidth : Double = 100 // the width of the of the side
    var bannerHeight : Double = 50 // the height of the banner
    // the final height/width will be more because we render the visual size

    var color : Color = .orange
    var orientation : Orientation = .topLeft

    private var orientationTransform : CGAffineTransform {

        let effectiveWidth = columnWidth + bannerHeight

        switch orientation {
            case .topRight:
                return CGAffineTransform.identity.scaledBy(x: -1.0, y: 1.0)
                    .translatedBy(x: -effectiveWidth, y: 0)

            case .bottomRight:
                return CGAffineTransform.identity.translatedBy(x: effectiveWidth, y: 2*bannerHeight)
                    .scaledBy(x: -1.0, y: -1.0)

            case .bottomLeft:
                return CGAffineTransform.identity.scaledBy(x: 1.0, y: -1.0)
                    .translatedBy(x: 0.0, y: -2*bannerHeight)

            case .topLeft:
                return CGAffineTransform.identity
        }
    }

    var body: some View {

        let effectiveWidth = columnWidth + bannerHeight

        Path { path in
            path.addArc(center: CGPoint(x: bannerHeight * 2, y: bannerHeight * 2),
                        radius: bannerHeight * 2 ,
                        startAngle: Angle(degrees: 180),
                        endAngle: Angle(degrees:270),
                        clockwise: false)
            path.addLine(to: CGPoint(x: effectiveWidth , y: 0.0))
            path.addArc(center: CGPoint(x: effectiveWidth, y: bannerHeight * 2),
                        radius: bannerHeight ,
                        startAngle: Angle(degrees: 270),
                        endAngle: Angle(degrees: 180),
                        clockwise: true)

            path.closeSubpath()
        }
        .applying(orientationTransform)
        .fill(color)
        .frame(width: effectiveWidth, height: bannerHeight * 2 )
    }
}

struct Corner_Previews: PreviewProvider {
    static var previews: some View {

        let bannerHeight = 45.0
        let columnWidth = 150.0

        Corner(columnWidth: columnWidth, bannerHeight: bannerHeight, color: .red, orientation: .bottomRight)

        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                Corner(columnWidth: columnWidth, bannerHeight: bannerHeight, color: .orange)
                Rectangle().fill(.orange).frame(width: nil, height: bannerHeight, alignment: .top)
                Corner(columnWidth: 20, bannerHeight: bannerHeight, color: .green, orientation: .topRight)
            }
            Rectangle().fill(.orange).frame(width: columnWidth, height: nil, alignment: .leading)

            HStack(alignment: .bottom, spacing: 0) {
                Corner(columnWidth: columnWidth, bannerHeight: bannerHeight, color: .purple, orientation: .bottomLeft)
                Rectangle().fill(.purple).frame(width: nil, height: bannerHeight, alignment: .top)
                Corner(columnWidth: 20, bannerHeight: bannerHeight, color: .green, orientation: .bottomRight)
            }
        }
        .padding()
        .previewLayout(.fixed(width: 800, height: 600))
    }
}
