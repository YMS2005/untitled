import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  final Function(bool)? onThemeChanged;

  const setting({super.key, this.onThemeChanged});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool autoUpdateEnabled = true;
  String selectedLanguage = 'English';

  // ── Theme Colors ─────────────────────────────────────────────
  static const Color _bgDark      = Color(0xFF060B18);   // primary background
  static const Color _bgCard      = Color(0xFF0F1A2E);   // card surface
  static const Color _bgCardAlt   = Color(0xFF16243D);   // alt card
  static const Color _accent      = Color(0xFF10E8A0);   // primary accent
  static const Color _accentDim   = Color(0xFF0CC880);   // dimmed accent
  static const Color _red         = Color(0xFFFF4D6D);   // red accent
  static const Color _textPrimary = Color(0xFFEEF2FF);   // primary text
  static const Color _textMuted   = Color(0xFF6B7FA3);   // muted text
  static const Color _border      = Color(0x0FFFFFFF);   // subtle border

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgDark,
      appBar: AppBar(
        backgroundColor: _bgDark,
        foregroundColor: _textPrimary,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.layers_rounded,
                  color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            const Text(
              "Settings",
              style: TextStyle(
                color: _textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Account Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Account",
              style: TextStyle(
                color: _textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: _accent),
            title: const Text("Profile", style: TextStyle(color: _textPrimary)),
            subtitle: const Text("Manage your profile", style: TextStyle(color: _textMuted)),
            trailing: Icon(Icons.arrow_forward, color: _textMuted),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.security, color: _accent),
            title: const Text("Security", style: TextStyle(color: _textPrimary)),
            subtitle: const Text("Password and authentication", style: TextStyle(color: _textMuted)),
            trailing: Icon(Icons.arrow_forward, color: _textMuted),
            onTap: () {},
          ),
          Divider(color: _border),
          // Notifications Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Notifications",
              style: TextStyle(
                color: _textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            secondary: Icon(Icons.notifications, color: _accent),
            title: const Text("Enable Notifications", style: TextStyle(color: _textPrimary)),
            value: notificationsEnabled,
            activeColor: _accent,
            onChanged: (bool value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          Divider(color: _border),
          // Display Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Display",
              style: TextStyle(
                color: _textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            secondary: Icon(Icons.dark_mode, color: _accent),
            title: const Text("Dark Mode", style: TextStyle(color: _textPrimary)),
            value: darkModeEnabled,
            activeColor: _accent,
            onChanged: (bool value) {
              setState(() {
                darkModeEnabled = value;
              });
              widget.onThemeChanged?.call(value);
            },
          ),
          ListTile(
            leading: Icon(Icons.language, color: _accent),
            title: const Text("Language", style: TextStyle(color: _textPrimary)),
            subtitle: Text(selectedLanguage, style: const TextStyle(color: _textMuted)),
            trailing: Icon(Icons.arrow_forward, color: _textMuted),
            onTap: () {},
          ),
          Divider(color: _border),
          // App Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "App",
              style: TextStyle(
                color: _textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            secondary: Icon(Icons.cloud_download, color: _accent),
            title: const Text("Auto Update", style: TextStyle(color: _textPrimary)),
            value: autoUpdateEnabled,
            activeColor: _accent,
            onChanged: (bool value) {
              setState(() {
                autoUpdateEnabled = value;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: _accent),
            title: const Text("About", style: TextStyle(color: _textPrimary)),
            subtitle: const Text("Version 1.0.0", style: TextStyle(color: _textMuted)),
            trailing: Icon(Icons.arrow_forward, color: _textMuted),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: _red),
            title: const Text("Logout", style: TextStyle(color: _red)),
            onTap: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
