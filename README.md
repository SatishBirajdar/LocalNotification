## The MVP basic concept.

According to the concept of clean architecture we should make strict boundary between the business logic and view logic. The other reason of using mvp-arch is to make our code base testable. So we can test the business logic part and view logic part separately. Therefore it isn’t good if we put anything logic on UIViewController.

For me the **Model** is a part which just only contain plain swift object. It is responsible to keep the state of some related object. **View** is a part which responsible to control the state of view’s component like Button, UITextField, UILabel, UITableView, UIImageView or minor text changes. We can enable or disable the button or command to show or hide the UIImageView. Besides, it also be liable manage the state of UIViewController’s lifecycle. The last part is **Presenter** which responsible to handle the business logic. It is may contain a set of rule to show or hide the UIImageView. 

## Local Notification:

Local notifications give you a way to alert the user at times when your app might not be running. You schedule local notifications at a time when your app is running either in the foreground or background. After scheduling a notification, the system takes on the responsibility of delivering the notification to the user at the appropriate time. Your app does not need to be running for the system to deliver the notification.

#### Configuring a Local Notification:
The steps for configuring a local notification are as follows:
1. Create and configure a UNMutableNotificationContent object with the notification details.
2. Create a UNCalendarNotificationTrigger, UNTimeIntervalNotificationTrigger, or UNLocationNotificationTrigger object to describe the conditions under which the notification is delivered.
3. Create a UNNotificationRequest object with the content and trigger information.
4. Call the addNotificationRequest:withCompletionHandler: method to schedule the notification.

## References:
* https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/SchedulingandHandlingLocalNotifications.html


