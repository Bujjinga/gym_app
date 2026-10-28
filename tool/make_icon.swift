// Draws the PULSE app icon and splash mark (macOS only):
//   swift tool/make_icon.swift
// then: dart run flutter_launcher_icons && dart run flutter_native_splash:create
//
// icon.png             1024² full-bleed: near-black + lime→cyan heartbeat line
// icon_macos.png       1024² rounded square on the macOS icon grid
// icon_foreground.png  1024² transparent, mark inside the Android adaptive safe zone
// splash.png           1152² transparent mark for the native splash (Android 12 crops a circle)

import AppKit

let background = NSColor(srgbRed: 0x07 / 255, green: 0x08 / 255, blue: 0x0A / 255, alpha: 1)
let lime = NSColor(srgbRed: 0xC6 / 255, green: 1, blue: 0x3D / 255, alpha: 1)
let cyan = NSColor(srgbRed: 0x22 / 255, green: 0xE1 / 255, blue: 1, alpha: 1)

/// Heartbeat path in a unit square (0…1), left to right.
func heartbeat(in rect: CGRect) -> CGPath {
  let pts: [(CGFloat, CGFloat)] = [
    (0.0, 0.5), (0.28, 0.5), (0.36, 0.36), (0.46, 0.80), (0.56, 0.12), (0.65, 0.62), (0.72, 0.5), (1.0, 0.5),
  ]
  let path = CGMutablePath()
  for (i, p) in pts.enumerated() {
    let point = CGPoint(x: rect.minX + p.0 * rect.width, y: rect.minY + (1 - p.1) * rect.height)
    if i == 0 { path.move(to: point) } else { path.addLine(to: point) }
  }
  return path
}

func render(size: Int, fill: Bool, markScale: CGFloat, macShape: Bool = false, to file: String) {
  let rep = NSBitmapImageRep(
    bitmapDataPlanes: nil, pixelsWide: size, pixelsHigh: size, bitsPerSample: 8, samplesPerPixel: 4,
    hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
  NSGraphicsContext.saveGraphicsState()
  NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
  let ctx = NSGraphicsContext.current!.cgContext
  let s = CGFloat(size)
  if macShape {
    // macOS icon grid: 824² rounded square centered in 1024², transparent margin.
    let inset = s * 100 / 1024
    ctx.addPath(CGPath(roundedRect: CGRect(x: inset, y: inset, width: s - 2 * inset, height: s - 2 * inset),
                       cornerWidth: s * 185 / 1024, cornerHeight: s * 185 / 1024, transform: nil))
    ctx.clip()
  }
  if fill {
    ctx.setFillColor(background.cgColor)
    ctx.fill(CGRect(x: 0, y: 0, width: s, height: s))
    // Soft lime glow behind the mark.
    let glow = CGGradient(colorsSpace: CGColorSpace(name: CGColorSpace.sRGB),
                          colors: [lime.withAlphaComponent(0.22).cgColor, lime.withAlphaComponent(0).cgColor] as CFArray,
                          locations: [0, 1])!
    ctx.drawRadialGradient(glow, startCenter: CGPoint(x: s / 2, y: s / 2), startRadius: 0,
                           endCenter: CGPoint(x: s / 2, y: s / 2), endRadius: s * 0.5, options: [])
  }
  let w = s * markScale
  let rect = CGRect(x: (s - w) / 2, y: (s - w * 0.62) / 2, width: w, height: w * 0.62)
  let outline = heartbeat(in: rect).copy(
    strokingWithWidth: s * 0.075 * markScale / 0.72, lineCap: .round, lineJoin: .round, miterLimit: 10)
  ctx.addPath(outline)
  ctx.clip()
  let gradient = CGGradient(colorsSpace: CGColorSpace(name: CGColorSpace.sRGB),
                            colors: [lime.cgColor, cyan.cgColor] as CFArray, locations: [0, 1])!
  ctx.drawLinearGradient(gradient, start: CGPoint(x: rect.minX, y: 0), end: CGPoint(x: rect.maxX, y: 0),
                         options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
  NSGraphicsContext.restoreGraphicsState()
  try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: file))
  print("wrote \(file)")
}

try! FileManager.default.createDirectory(atPath: "assets/icon", withIntermediateDirectories: true)
render(size: 1024, fill: true, markScale: 0.72, to: "assets/icon/icon.png")
render(size: 1024, fill: true, markScale: 0.6, macShape: true, to: "assets/icon/icon_macos.png")
render(size: 1024, fill: false, markScale: 0.5, to: "assets/icon/icon_foreground.png")
render(size: 1152, fill: false, markScale: 0.42, to: "assets/icon/splash.png")
