import SwiftUI
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

extension UIImage {
    func dominantColors(count: Int = 2) -> [UIColor] {
        guard let inputImage = CIImage(image: self) else { return [] }
        let _ = [
            kCIInputImageKey: inputImage,
            kCIInputExtentKey: CIVector(cgRect: inputImage.extent),
            "inputCubeDimension": 2
        ] as [String : Any]

        let filter = CIFilter.kMeans()
        filter.inputImage = inputImage
        filter.count = count

        guard let outputImage = filter.outputImage else { return [] }
        let context = CIContext()
        guard let bitmap = context.createCGImage(outputImage, from: outputImage.extent) else { return [] }

        let uiImage = UIImage(cgImage: bitmap)
        let colors = uiImage.getPixelColors()

        return colors
    }

    func getPixelColors() -> [UIColor] {
        guard let cgImage = self.cgImage else { return [] }
        let width = cgImage.width
        let height = cgImage.height
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let bitsPerComponent = 8
        let pixelData = UnsafeMutablePointer<UInt8>.allocate(capacity: width * height * bytesPerPixel)
        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let context = CGContext(
            data: pixelData,
            width: width,
            height: height,
            bitsPerComponent: bitsPerComponent,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )

        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))

        var colors: [UIColor] = []
        for y in 0..<height {
            for x in 0..<width {
                let offset = (y * bytesPerRow) + (x * bytesPerPixel)
                let red = CGFloat(pixelData[offset]) / 255.0
                let green = CGFloat(pixelData[offset + 1]) / 255.0
                let blue = CGFloat(pixelData[offset + 2]) / 255.0
                let alpha = CGFloat(pixelData[offset + 3]) / 255.0
                let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                colors.append(color)
            }
        }
        pixelData.deallocate()
        return Array(Set(colors)).prefix(2).map { $0 }
    }
}
