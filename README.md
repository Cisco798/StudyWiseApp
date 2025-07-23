# 📚 StudyWise

StudyWise is a Flutter-based mobile application designed to help students enhance their academic success through structured study planning, note-taking, flashcard review, and performance tracking. The app combines both local and cloud storage solutions, including Firebase and SQLite, and promotes personalized learning with dark/light theme options.

---

## 🚀 Features

| Feature | Description |
|--------|-------------|
| 🔐 Authentication | Secure login/sign-up via Firebase Auth |
| 🏠 Home Dashboard | Bottom navigation to Notes, Flashcards, Goals, and Profile |
| 📝 Notes | Create and manage notes stored locally using SQLite |
| 🧠 Flashcards | Add, view, and study flashcards synced with Cloud Firestore |
| 🎯 Study Goals | Set and track goals using SharedPreferences |
| 📊 Progress Tracker | Visual chart of completed vs. pending goals |
| 🌓 Theme Toggle | Switch between dark and light modes |
| 👤 Profile | View logged-in user info and logout |
| ⚙️ Settings | Adjust preferences, view app version and feedback options |

---

## 🧰 Tech Stack

- **Flutter & Dart**
- **Firebase** (Auth, Firestore, Storage)
- **SQLite** via `sqflite`
- **SharedPreferences**
- **Provider** for state management

---

## 🔧 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Cisco798/studywise.git
cd studywise
