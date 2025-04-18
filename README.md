# 🎟️ SellMySeat – Buy & Sell Event Tickets

[SellMySeat](https://github.com/RafIOS96/SellMySeat.git) is a mobile iOS application that lets users **sell** their extra or unused tickets and **buy** tickets from others. Whether it’s a concert, airplane flight, theater performance, or festival, SellMySeat makes ticket exchange fast, secure, and effortless.

---

## 📲 Features

- 📝 List your own tickets for sale (concerts, flights, theater, etc.)
- 🔍 Browse available tickets from other users
- 📂 View ticket details including seat info, price, and seller
- 🛒 Buy tickets with a few simple steps
- 🧾 Track your purchases and sales
- 📤 Upload images of your tickets
- 🔔 Receive notifications for new listings or messages
- 🔐 Secure authentication with Firebase

---

## 🧑‍💻 Tech Stack

- **Swift (iOS)**
- **Firebase**:
  - Authentication
  - Firestore Database
  - Firebase Storage (for ticket images)
  - Cloud Messaging (for push notifications)
- **UIKit** based UI
- **SDWebImage** for async image loading
- (Optional) Stripe or Apple Pay for payments

---

## 📸 Screenshots

> _Add your app screenshots here_

| Home | Tickets List | Ticket Details |
|------|--------------|----------------|
| ![](screenshots/home.png) | ![](screenshots/list.png) | ![](screenshots/details.png) |

---

## 🚀 Getting Started

To get the app running locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/RafIOS96/SellMySeat.git
   cd SellMySeat
   ```

2. Open the project in **Xcode**

3. Install dependencies via Swift Package Manager or CocoaPods (if used)

4. Make sure you have your `GoogleService-Info.plist` file from Firebase Console

5. Run the app on a simulator or physical device

---

## 🔒 Firebase Services Used

- 🔐 **Authentication** – Sign up, log in, and manage users
- ☁️ **Firestore** – Real-time database to store ticket data
- 📦 **Storage** – Upload and retrieve ticket images
- 📲 **Cloud Messaging** – Send push notifications

---

## 🛠 Dependencies

- [Firebase](https://firebase.google.com/)
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
- [SwiftLint](https://github.com/realm/SwiftLint) *(optional for code quality)*

---

## 📌 Roadmap

- ✅ Core buying/selling functionality
- 🔄 Chat between buyers and sellers *(coming soon)*
- 🌍 Location-based ticket suggestions
- 📅 Calendar integration for event reminders
- 🌐 Multilanguage support (Armenian, English, etc.)

---

## 🤝 Contributing

Pull requests and feedback are welcome! Please feel free to fork the repo and submit PRs.

---

## 📄 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for more info.

---

## 📬 Contact

- **GitHub**: [@RafIOS96](https://github.com/RafIOS96)
- **Email**: rafael.aghayann@gmail.com

---

> Made with ❤️ by Rafael Aghayan
