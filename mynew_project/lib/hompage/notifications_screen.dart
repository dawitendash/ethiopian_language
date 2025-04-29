import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart'
    as timeago; // Using timeago for better date formatting

// Simple data model for a notification
class NotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final DateTime timestamp;
  final NotificationType type;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });
}

// Enum to categorize notifications
enum NotificationType { message, progress, system, reminder, update }

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // --- Placeholder Notification Data ---
  // Ensure this list is initialized correctly. In a real app, fetch asynchronously.
  final List<NotificationItem> _notifications = [
    NotificationItem(
      id: '1',
      title: 'New Message: Oromiffa Practice',
      subtitle: 'Bilisuma sent you a message.',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      type: NotificationType.message,
    ),
    NotificationItem(
      id: '2',
      title: 'Streak Milestone!',
      subtitle: '🔥 You\'ve reached a 5-day learning streak in Amharic!',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      type: NotificationType.progress,
      isRead: true,
    ),
    NotificationItem(
      id: '3',
      title: 'Daily Reminder',
      subtitle: 'Time for your Tigrigna lesson!',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
      type: NotificationType.reminder,
    ),
    NotificationItem(
      id: '4',
      title: 'Level Complete!',
      subtitle: 'Congratulations! You finished Amharic Beginner 1.',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      type: NotificationType.progress,
    ),
    NotificationItem(
      id: '5',
      title: 'Offline Content Ready',
      subtitle: 'Your Oromiffa lessons are downloaded.',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      type: NotificationType.system,
    ),
    NotificationItem(
      id: '6',
      title: 'New Partner Match',
      subtitle: 'Found a potential partner: Chaltu G.',
      timestamp: DateTime.now().subtract(Duration(days: 2, hours: 5)),
      type: NotificationType.message,
    ),
  ];

  // Helper function to get icon based on type
  IconData _getIconForType(NotificationType type) {
    // Ensure all enum types are handled or have a default
    switch (type) {
      case NotificationType.message:
        return Icons.chat_bubble_outline;
      case NotificationType.progress:
        return Icons.star_border_outlined;
      case NotificationType.reminder:
        return Icons.alarm;
      case NotificationType.system:
        return Icons.cloud_done_outlined;
      case NotificationType.update:
        return Icons.system_update_alt_outlined;
      default:
        // Fallback icon in case of unexpected enum value
        return Icons.notifications_none;
    }
  }

  @override
  void initState() {
    super.initState();
    // Sort notifications once when the screen loads
    _notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    // Add custom messages for timeago if needed (especially for local languages)
    // timeago.setLocaleMessages('am', timeago.AmMessages()); // Example if using Amharic locale
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        // Optional: Add actions like "Mark all as read"
        actions: [
          // Add a button to clear all notifications (for testing/example)
          if (_notifications.isNotEmpty)
            TextButton(
              onPressed: () {
                setState(() {
                  // Mark all as read (visually)
                  for (var n in _notifications) {
                    n.isRead = true;
                  }
                  // Or clear the list for testing:
                  // _notifications.clear();
                });
              },
              child: Text("Mark All Read"),
            ),
        ],
      ),
      body: SafeArea(
        // Ensure content avoids notches/system bars
        child:
            _notifications.isEmpty
                ? Center(
                  child: Column(
                    // Provide more context if empty
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_off_outlined,
                        size: 60,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No notifications yet.',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                )
                : ListView.separated(
                  // Use separated for dividers
                  itemCount: _notifications.length,
                  separatorBuilder:
                      (context, index) =>
                          Divider(height: 1, indent: 72), // Add dividers
                  itemBuilder: (context, index) {
                    // Check if index is valid (it should be, but defensive)
                    if (index >= _notifications.length) {
                      return SizedBox.shrink(); // Render nothing if index is somehow out of bounds
                    }
                    final notification = _notifications[index];

                    // Use try-catch around potentially problematic parts if needed,
                    // but standard widgets here shouldn't cause an 'X'.
                    try {
                      return ListTile(
                        leading: Icon(
                          _getIconForType(notification.type),
                          color:
                              notification.isRead
                                  ? Colors.grey
                                  : Theme.of(context).primaryColor,
                          size: 28, // Slightly larger icon
                        ),
                        title: Text(
                          notification.title,
                          style: TextStyle(
                            fontWeight:
                                notification.isRead
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          notification.subtitle,
                          maxLines:
                              2, // Prevent long subtitles from overflowing badly
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          // Use timeago package for readable relative time
                          timeago.format(
                            notification.timestamp,
                            locale: 'en_short',
                          ), // Use 'en_short' for brevity like '5m', '1h'
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        onTap: () {
                          print('Tapped notification: ${notification.title}');
                          // Only update state if it's actually unread
                          if (!notification.isRead) {
                            setState(() {
                              notification.isRead = true;
                              // TODO: Update the actual notification state in your backend/database
                              // TODO: Potentially decrease the badge count on the previous screen
                            });
                          }
                          // TODO: Implement actual navigation based on notification.type
                          // e.g., if (notification.type == NotificationType.message) { ... navigate to chat ... }
                        },
                        // Visual density can make items more compact
                        // visualDensity: VisualDensity.compact,
                      );
                    } catch (e) {
                      // If a specific ListTile fails, show an error tile instead of crashing
                      print(
                        "Error building notification tile for ID ${notification.id}: $e",
                      );
                      return ListTile(
                        leading: Icon(Icons.error_outline, color: Colors.red),
                        title: Text("Error loading notification"),
                        subtitle: Text(notification.id),
                      );
                    }
                  },
                ),
      ),
    );
  }
}
