// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationMoloco",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationMoloco", targets: ["Yodo1MasMediationMolocoTarget"]),
        .library(name: "Yodo1MasMediationMoloco-AppLovinMediationMolocoAdapter", targets: ["Yodo1MasMediationMoloco-AppLovinMediationMolocoAdapterTarget"]),
        .library(name: "Yodo1MasMediationMoloco-MolocoAdapter", targets: ["Yodo1MasMediationMoloco-MolocoAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/moloco/moloco-sdk-ios-spm.git", exact: "4.10.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationMoloco ====================
        .target(
            name: "Yodo1MasMediationMolocoTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationMoloco"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "MolocoSDK", package: "moloco-sdk-ios-spm"),
            ],
            path: "Sources/Yodo1MasMediationMolocoTarget",
            resources: [.copy("Yodo1MasMoloco.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationMoloco",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationMoloco/Yodo1MasMediationMoloco-5.0.0-beta.5.zip",
            checksum: "74acfbf25ec8b3b65a545a1d5104fd2a8ceb895d266d46d8c2c3c0cfb6c13df5"
        ),
        // ==================== Yodo1MasMediationMoloco-AppLovinMediationMolocoAdapter ====================
        .target(
            name: "Yodo1MasMediationMoloco-AppLovinMediationMolocoAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationMolocoTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationMolocoAdapter"),
            ],
            path: "Sources/Yodo1MasMediationMoloco-AppLovinMediationMolocoAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationMolocoAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationMoloco/AppLovinMediationMolocoAdapter-5.0.0-beta.5.zip",
            checksum: "3bd932938441c127dd8359586ac04536ac3104461378a181075ebc6441f09671"
        ),
        // ==================== Yodo1MasMediationMoloco-MolocoAdapter ====================
        .target(
            name: "Yodo1MasMediationMoloco-MolocoAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationMolocoTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "MolocoAdapter"),
            ],
            path: "Sources/Yodo1MasMediationMoloco-MolocoAdapterTarget"
        ),
        .binaryTarget(
            name: "MolocoAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationMoloco/MolocoAdapter-5.0.0-beta.5.zip",
            checksum: "a50e1691d372fc56168683a836d128a4937b688300b03343a812db21a2714277"
        ),
    ]
)
