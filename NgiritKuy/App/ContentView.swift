//
//  ContentView.swift
//  NgiritKuy
//
//  Created by Miftah Fauzy on 26/03/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @StateObject private var gameCenter = GameCenterManager.shared

    var body: some View {
            // Foods tab
            StallsTabView()
                .tabItem {
                    VStack {
                        Spacer(minLength: 20)
                        Image(
                            uiImage: resizeImage(
                                UIImage(systemName: "fork.knife.circle.fill")!,
                                targetSize: CGSize(width: 20, height: 27))!)
                        Text("Stalls")

                    }
                }
        .onAppear {
//            if !gameCenter.isAuthenticated {
//                Task {
//                    gameCenter.authenticatePlayer()
//                }
//            }
        }
    }
}

func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage? {
    let size = image.size

    // Calculate the scaling factor to fit the image to the target dimensions while maintaining the aspect ratio
    let widthRatio = targetSize.width / size.width
    let heightRatio = targetSize.height / size.height
    let ratio = min(widthRatio, heightRatio)

    let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
    let yOffset = (targetSize.height - newSize.height)  // Leave the top blank and align the bottom

    //Create a new image context
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    let newImage = renderer.image { context in
        // Fill the background with a transparent color
        context.cgContext.setFillColor(UIColor.clear.cgColor)
        context.cgContext.fill(CGRect(origin: .zero, size: targetSize))

        // draw new image
        image.draw(
            in: CGRect(
                x: 0, y: yOffset, width: newSize.width, height: newSize.height))
    }

    return newImage
}
