//
//  HomePresenter.swift
//  LocalNotificationRecipe
//
//  Created by satish birajdar on 2019-02-21.
//  Copyright © 2019 SBSoftwares. All rights reserved.
//

import Foundation
import UserNotifications

protocol HomePresenterDelegate {
    func updateStatus(message: String)
}

class HomePresenter {

    var delegate : HomePresenterDelegate

    init(delegate: HomePresenterDelegate) {
        self.delegate = delegate
    }

    func registerCustomNotification() {
        // Create "the notification's category value type."
        let customNotificationCategory = UNNotificationCategory(identifier: "customNotification", actions: [], intentIdentifiers: [], options: [])
        // Register the notification type.
        UNUserNotificationCenter.current().setNotificationCategories([customNotificationCategory])
    }

    func sendNotificationClicked() {
        self.delegate.updateStatus(message: "Press home button and wait for 5 seconds, to see the Notification")

        // find out what are the user's notification preferences
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in

            // we're only going to create and schedule a notification
            // if the user has kept notifications authorized for this app
            guard settings.authorizationStatus == .authorized else { return }

            // create the content and style for the local notification
            let content = UNMutableNotificationContent()

            // Assign a value to this property that matches the identifier
            // property of one of the UNNotificationCategory objects you
            // previously registered with your app.
            content.categoryIdentifier = "customNotification"

            // create the notification's content to be presented
            // to the user
            content.title = "TITLE"
            content.subtitle = "Subtitle"
            content.body = "This is a message."
            content.sound = UNNotificationSound.default
            content.launchImageName = "notification_image"

            // create a "trigger condition that causes a notification
            // to be delivered after the specified amount of time elapses";
            // deliver after 5 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            // create a "request to schedule a local notification, which
            // includes the content of the notification and the trigger conditions for delivery"
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

            // Upon calling this method, the system begins tracking the
            // trigger conditions associated with your request. When the
            // trigger condition is met, the system delivers your notification.
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}
