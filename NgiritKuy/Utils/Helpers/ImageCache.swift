//
//  ImageCache.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 08/04/25.
//

import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    private var cache: [String: UIImage] = [:]

    func getImage(for key: String) -> UIImage? {
        return cache[key]
    }

    func setImage(_ image: UIImage, for key: String) {
        cache[key] = image
    }
}

// Add a CachedImage view for efficient image loading
struct CachedImage: View {
    let imageData: Data?
    let id: UUID

    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay {
                        Image(systemName: "fork.knife")
                            .font(.system(size: 30))
                            .foregroundStyle(.gray)
                    }
            }
        }
        .onAppear {
            loadImage()
        }
    }

    private func loadImage() {
        let cacheKey = id.uuidString

        // Check if image is already cached
        if let cachedImage = ImageCache.shared.getImage(for: cacheKey) {
            self.image = cachedImage
            return
        }

        // Load image in background if not cached
        guard let imageData = imageData else { return }

        DispatchQueue.global(qos: .userInitiated).async {
            if let uiImage = UIImage(data: imageData) {
                // Resize image to reasonable dimensions
                let resizedImage = resizeImageIfNeeded(
                    uiImage, maxDimension: 500)

                // Cache the result
                ImageCache.shared.setImage(resizedImage, for: cacheKey)

                DispatchQueue.main.async {
                    self.image = resizedImage
                }
            }
        }
    }
}

// Helper function to resize large images
func resizeImageIfNeeded(_ image: UIImage, maxDimension: CGFloat) -> UIImage {
    let size = image.size

    let targetSize: CGSize
    if size.width > size.height {
        let scaleFactor = maxDimension / size.width
        targetSize = CGSize(
            width: maxDimension, height: size.height * scaleFactor)
    } else {
        let scaleFactor = maxDimension / size.height
        targetSize = CGSize(
            width: size.width * scaleFactor, height: maxDimension)
    }

    // Only resize if image is larger than maxDimension
    if size.width <= maxDimension && size.height <= maxDimension {
        return image
    }

    let format = UIGraphicsImageRendererFormat()
    format.scale = 1

    let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
    let resized = renderer.image { _ in
        image.draw(in: CGRect(origin: .zero, size: targetSize))
    }

    return resized
}
