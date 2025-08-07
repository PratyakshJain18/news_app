# 📰 News App (Flutter + REST API)

My first news app built using **Flutter** and a public **News API**.  
Inspired by modern news apps and focused on clean UI, API integration, and real-time data fetching.

---

## 🚀 Features

- 🌐 Fetches latest news headlines from News API
- 📄 Clean and minimal UI
- 🧭 Category-based news navigation
- 🖼️ Article thumbnails with titles
- 🔗 Tap to open full articles in browser
- 🕒 ISO 8601 date parsing and formatting using `intl`

---

## 🛠️ Tech Stack

- **Flutter** — Frontend framework  
- **HTTP** — REST API integration  
- **Intl** — Date formatting  
- **GetX** — Routing and simple state management  
- **NewsAPI.org** — News data provider  
- ~~**url_launcher** — To open article links in browser~~  
- **webview_flutter** — Used to open article links inside the app (replaced `url_launcher` for a better UX)

### 🔄 Update Note

Originally, article links were opened using `url_launcher`, which launched them in an external browser.  
This was later replaced with `webview_flutter` to allow users to view articles directly inside the app for a more seamless experience.

---

## 👨‍💻 Author

**Pratyaksh Jain**  
_Pre-1st year, NIT Allahabad_
