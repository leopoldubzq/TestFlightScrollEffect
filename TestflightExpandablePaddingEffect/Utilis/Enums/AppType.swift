import Foundation
import UIKit

enum AppType: String, CaseIterable {
    case telegram
    case whatsapp
    case youtube
    case instagram
    case facebook
    
    var iconName: String {
        "\(rawValue)_app_icon"
    }
    
    var title: String {
        switch self {
        case .telegram:
            return "Telegram"
        case .whatsapp:
            return "WhatsApp"
        case .youtube:
            return "YouTube"
        case .instagram:
            return "Instagram"
        case .facebook:
            return "Facebook"
        }
    }
    
    var version: String {
        switch self {
        case .telegram:
            return "9.2.1 (1234)"
        case .whatsapp:
            return "2.23.18 (5678)"
        case .youtube:
            return "18.34.5 (9101)"
        case .instagram:
            return "305.0.0 (1122)"
        case .facebook:
            return "401.1.0 (3344)"
        }
    }
    
    var expiration: String {
        return "Expires in \(expirationDays) days"
    }

    var expirationDays: Int {
        switch self {
        case .telegram:
            return 15
        case .whatsapp:
            return 30
        case .youtube:
            return 7
        case .instagram:
            return 20
        case .facebook:
            return 10
        }
    }

    var developer: String {
        switch self {
        case .telegram:
            return "Telegram FZ-LLC"
        case .whatsapp:
            return "Meta Platforms, Inc."
        case .youtube:
            return "Google LLC"
        case .instagram:
            return "Meta Platforms, Inc."
        case .facebook:
            return "Meta Platforms, Inc."
        }
    }

    var category: String {
        switch self {
        case .telegram:
            return "Messaging"
        case .whatsapp:
            return "Social Networking"
        case .youtube:
            return "Video Sharing"
        case .instagram:
            return "Photo & Video"
        case .facebook:
            return "Social Networking"
        }
    }

    var description: String {
        switch self {
        case .telegram:
            return "Test messaging speed, group chats, and media sharing features."
        case .whatsapp:
            return "Check the performance of voice and video calls, and privacy settings."
        case .youtube:
            return "Ensure smooth video playback, comment system, and notifications."
        case .instagram:
            return "Test photo uploads, stories, reels, and messaging functionality."
        case .facebook:
            return "Verify news feed performance, profile updates, and group interactions."
        }
    }
}
