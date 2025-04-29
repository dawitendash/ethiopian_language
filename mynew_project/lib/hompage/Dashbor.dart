import 'package:flutter/material.dart';
import 'notifications_screen.dart';

// Root widget of the application

// The main Dashboard Screen Widget
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // --- State Variables ---
  String _selectedLanguage = 'Amharic';
  final List<String> _languages = ['Amharic', 'Oromiffa', 'Tigrigna'];
  String _userName = "Abebe";
  double _currentLevelProgress = 0.65;
  int _streakDays = 5;
  int _unreadMessages = 3;
  bool _isOfflineAvailable = true;
  int _unreadNotificationCount =
      4; // This should be derived from actual unread notifications

  void _changeLanguage(String? newValue) {
    if (newValue != null && newValue != _selectedLanguage) {
      setState(() {
        _selectedLanguage = newValue;
        print("Language changed to: $_selectedLanguage");
        // Fetch real progress for the new language
        _currentLevelProgress =
            (_selectedLanguage == 'Amharic')
                ? 0.65
                : (_selectedLanguage == 'Oromiffa' ? 0.30 : 0.15);
      });
    }
  }

  void _goToNotifications() async {
    // Navigate and wait for the result (e.g., if the screen tells us the count changed)
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationsScreen()),
    );
    // When returning from Notifications screen, potentially refresh the count
    // This requires more complex state management or passing data back.
    // For now, we just navigate. Let's simulate reading some:
    if (_unreadNotificationCount > 0) {
      setState(() {
        // Example: Assume 2 notifications were read. In reality, you'd get this info back.
        _unreadNotificationCount = (_unreadNotificationCount - 2).clamp(0, 100);
      });
    }
    print(
      "Returned from Notifications Screen. New count: $_unreadNotificationCount",
    );
  }

  // --- Build Method ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text(
          'Lissan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ), // Example styling
        ),
        actions: [
          _buildNotificationIcon(),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black87,
            ),
            tooltip: 'Profile',
            onPressed: () {
              print("Profile Tapped");
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surfaceVariant,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingSection(),
              const SizedBox(height: 20),
              _buildProgressCard(),
              const SizedBox(height: 20),
              _buildStreakCard(),
              const SizedBox(height: 20),
              _buildLanguageExchangeCard(_unreadMessages),
              const SizedBox(height: 20),
              _buildOfflineStatus(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildNotificationIcon() {
    return Center(
      child: InkWell(
        onTap: _goToNotifications,
        customBorder: const CircleBorder(),
        child: Padding(
          // Add padding to make tap target larger
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(
                  8.0,
                ), // Padding inside the stack for the icon
                child: Icon(
                  Icons.notifications_outlined,
                  size: 26,
                  color: Colors.black54, // Subtle color
                ),
              ),
              if (_unreadNotificationCount > 0)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent, // Slightly different red
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        // Show '9+' if count is too high
                        '${_unreadNotificationCount > 9 ? '9+' : _unreadNotificationCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    String greeting = "Selam";
    if (_selectedLanguage == 'Oromiffa') {
      greeting = "Akkam";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, $_userName!',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Currently Learning: ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: _selectedLanguage,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.primary,
              ),
              elevation: 16,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              underline: Container(
                height: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onChanged: _changeLanguage,
              items:
                  _languages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedLanguage,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Current Level: Beginner 2'),
            const SizedBox(height: 4),
            const Text('Next Lesson: Lesson 5: Asking for Directions'),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: _currentLevelProgress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${(_currentLevelProgress * 100).toInt()}% Complete'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Continue Lesson'),
              onPressed: () {
                print('Continue Lesson Tapped for $_selectedLanguage');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(
              Icons.local_fire_department,
              color: Colors.orange,
              size: 30,
            ),
            const SizedBox(width: 12),
            Expanded(
              // Allow text to wrap if needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Streak: $_streakDays days 🔥',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Keep up the great work!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageExchangeCard(int unreadMessages) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language Exchange',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                unreadMessages > 0
                    ? 'You have $unreadMessages new messages!'
                    : 'Practice with native speakers.',
                style: TextStyle(
                  color:
                      unreadMessages > 0
                          ? Colors.deepOrangeAccent
                          : Colors.grey.shade700,
                  fontWeight:
                      unreadMessages > 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Spread buttons
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.search_outlined, size: 18),
                  label: const Text('Find Partners'),
                  onPressed: () {
                    print('Find Partners Tapped');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(
                          context,
                        ).colorScheme.tertiaryContainer, // Lighter background
                    foregroundColor:
                        Theme.of(
                          context,
                        ).colorScheme.onTertiaryContainer, // Darker text/icon
                    elevation: 1, // Less shadow
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.chat_outlined, size: 18),
                  label: const Text('My Chats'),
                  onPressed: () {
                    print('My Chats Tapped');
                  },
                  style: ElevatedButton.styleFrom(
                    // Highlight if messages exist
                    backgroundColor:
                        unreadMessages > 0
                            ? Colors.orange.shade100
                            : Theme.of(context).colorScheme.tertiaryContainer,
                    foregroundColor:
                        unreadMessages > 0
                            ? Colors.orange.shade900
                            : Theme.of(context).colorScheme.onTertiaryContainer,
                    elevation: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _isOfflineAvailable
              ? Icons.cloud_done_outlined
              : Icons.cloud_off_outlined,
          color:
              _isOfflineAvailable
                  ? Colors.green.shade600
                  : Colors.grey.shade600,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          _isOfflineAvailable
              ? 'Lessons available offline'
              : 'Offline access disabled',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
        ),
      ],
    );
  }
} // End of _DashboardScreenState class
