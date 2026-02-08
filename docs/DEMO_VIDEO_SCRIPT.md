# Demo Video Script — Khana Khazana iOS App

Shot-by-shot script for a **2–3 minute** portfolio demo. Covers app launch, home, login, menu, add to cart, checkout (final bill), and About Us. Optional: QR scan if you add it later.

---

## Tools to record

| Tool | Use |
|------|-----|
| **QuickTime Player** (macOS) | **File → New Screen Recording** to capture Simulator; use built-in mic for voiceover or record audio separately. |
| **Simulator** | Run the app (⌘R); use **File → Save Screen** (⌘S) for stills only. |
| **OBS Studio** (free) | Alternative for screen + mic, more control over sources. |
| **iPhone + cable** | Record the device screen via QuickTime: connect iPhone → **File → New Movie Recording** → select camera as iPhone. |

**Recommendation:** QuickTime screen recording of the Simulator + voiceover (or silent with captions).

---

## Suggested length: 2–3 minutes

| Section | Duration | Content |
|--------|----------|---------|
| Intro + Home | ~20 s | App icon, launch, Home screen. |
| Login | ~15 s | Tap Login, show login screen, tap to continue. |
| Menu + Cart | ~45 s | Open menu, scroll, add 2–3 items to cart. |
| Checkout | ~25 s | Order Now, show final bill. |
| About Us | ~15 s | Navigate to About Us, show web view. |
| Outro | ~10 s | Back to home or app icon; call to action. |

---

## Shot-by-shot script

### 1. Intro (0:00–0:15)

| Shot | Screen / action | Narration (optional) |
|------|------------------|----------------------|
| 1.1 | Simulator or device home; tap app icon. | “Khana Khazana is an iOS restaurant ordering app built with Swift and UIKit.” |
| 1.2 | App launches; Home screen visible (Sign Up / Login). | “From the home screen you can sign up or log in.” |

### 2. Login (0:15–0:30)

| Shot | Screen / action | Narration |
|------|------------------|-----------|
| 2.1 | Tap **Login**. | “I’ll tap Login.” |
| 2.2 | Login screen (email/username, password). | “Enter credentials and continue to the account.” |
| 2.3 | Tap the login button (or segue). | “After login we reach the account screen.” |

### 3. Menu and add to cart (0:30–1:15)

| Shot | Screen / action | Narration |
|------|------------------|-----------|
| 3.1 | From Account, open the **menu** (e.g. TableView / menu list). | “From the account we open the menu — dishes are loaded from a local SQLite database.” |
| 3.2 | Scroll the menu list (dishes, prices, images). | “Each dish shows name, price, and image.” |
| 3.3 | Tap **Add to cart** on one dish. | “I’ll add a few items to the cart.” |
| 3.4 | Add one or two more items. | “And another.” |
| 3.5 | Optional: tap a row to open dish detail (DescriptionViewController). | “Tapping a row shows the dish detail.” |

### 4. Checkout — Final bill (1:15–1:40)

| Shot | Screen / action | Narration |
|------|------------------|-----------|
| 4.1 | Tap **Order Now**. | “When ready, Order Now takes us to the final bill.” |
| 4.2 | Final bill screen with selected items. | “The selected items are shown here for review before completing the order.” |

### 5. About Us (1:40–1:55)

| Shot | Screen / action | Narration |
|------|------------------|-----------|
| 5.1 | Navigate to **About Us** (from menu options or account). | “About Us loads the restaurant website in-app.” |
| 5.2 | Web view (khanakhazana.com) visible. | “Users can read more about the restaurant without leaving the app.” |

### 6. Outro (1:55–2:10)

| Shot | Screen / action | Narration |
|------|------------------|-----------|
| 6.1 | Return to Home or show app icon. | “Khana Khazana — Swift, UIKit, and SQLite. Thanks for watching.” |
| 6.2 | Optional: title card with repo or portfolio link. | — |

**Optional — QR scan (if you add the feature later):** Add a 15–20 s segment: “You can also scan a table QR code to open the menu” and show scan → menu flow.

---

## Recording tips

- **Simulator:** Use **iPhone 15** or **iPhone 14**; scale Simulator so the app fills most of the recording area.
- **Resolution:** 1080p is enough; avoid tiny text.
- **Pace:** Pause 1–2 seconds on each main screen so viewers can read.
- **Voiceover:** Record in a quiet room; speak clearly and slightly slower than normal.
- **Silent version:** Add short text overlays (e.g. “Login”, “Add to cart”, “Final bill”) instead of narration.

---

## Uploading to YouTube

1. **Create a YouTube channel** (or use an existing one).
2. **Upload:** YouTube Studio → **Create → Upload videos** → select your file.
3. **Details:** Title (e.g. “Khana Khazana — iOS Restaurant Ordering App (Swift, UIKit)”), description (short app summary + repo link), visibility (Unlisted or Public).
4. **Thumbnail:** Use a clear frame (e.g. menu or home screen) or a simple title image.
5. **Copy the video URL** (e.g. `https://www.youtube.com/watch?v=XXXXX`).

---

## Embedding the video in the README

After you have the video URL, add a **Demo** section to the README (e.g. after Screenshots):

```markdown
## 🎬 Demo

Watch a short walkthrough of the app:

[![Khana Khazana Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

*Click the thumbnail to play on YouTube.*
```

Replace `YOUR_VIDEO_ID` with the ID from your URL (e.g. `dQw4w9WgXcQ` from `https://www.youtube.com/watch?v=dQw4w9WgXcQ`).

---

## Checklist

- [ ] Choose recording tool (QuickTime recommended).
- [ ] Run app in Simulator; go through flow once without recording.
- [ ] Record in one take or in segments (edit if needed).
- [ ] Add narration or text overlays.
- [ ] Export (e.g. MP4, 1080p).
- [ ] Upload to YouTube; set title, description, visibility.
- [ ] Copy video URL and add embed to README (Demo section).
