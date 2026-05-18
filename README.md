# spotube-plugin-tidal

> 🎵 **Tidal metadata provider plugin for [Spotube](https://github.com/KRTirtho/spotube)**

Browse your Tidal library, playlists, albums and artists directly inside Spotube — without needing the Tidal app.

---

## Features

- 🔐 OAuth 2.0 PKCE login with Tidal
- 🔍 Full search: tracks, albums, artists, playlists
- 📚 Your Tidal library (saved tracks, albums, playlists, artists)
- 🎨 Browse home sections & new releases
- 📡 Artist radio / track radio
- ✅ Auto token refresh

---

## Requirements

- [Spotube](https://spotube.krtirtho.dev/downloads) v4.0.0+
- A **Tidal** account (free or HiFi)
- A **Tidal Developer** app at [developer.tidal.com](https://developer.tidal.com)

---

## Setup

### 1. Create a Tidal Developer App

1. Go to [developer.tidal.com](https://developer.tidal.com) → **Dashboard → New App**
2. Set **Redirect URI** to: `spotube://tidal-callback`
3. Copy your **Client ID**

### 2. Configure the Plugin

Open `src/utils/config.ht` and paste your Client ID:

```
var TIDAL_CLIENT_ID = 'YOUR_CLIENT_ID_HERE';
```

### 3. Build the Plugin

```bash
# Install Hetu Script compiler globally
dart pub global activate hetu_script_dev_tools

# Build
make

# Output: spotube-plugin-tidal.smplug
```

### 4. Install in Spotube

- Open Spotube → **Settings** → **Metadata Provider Plugins**
- Tap the **Upload (📤)** button
- Select `spotube-plugin-tidal.smplug`
- Tap **Login** and sign in with Tidal

---

## Project Structure

```
spotube-plugin-tidal/
├── plugins.json              # Plugin manifest
├── Makefile                  # Build script
├── src/
│   ├── main.ht               # Entry point (TidalPlugin class)
│   ├── utils/
│   │   ├── config.ht         # Client ID & API constants
│   │   ├── mappers.ht        # Tidal API → Spotube model converters
│   │   └── pagination.ht     # Pagination helpers
│   └── segments/
│       ├── auth.ht           # OAuth2 PKCE authentication
│       ├── user.ht           # User library endpoints
│       ├── track.ht          # Track endpoints
│       ├── album.ht          # Album endpoints
│       ├── artist.ht         # Artist endpoints
│       ├── playlist.ht       # Playlist endpoints
│       ├── search.ht         # Search endpoints
│       ├── browse.ht         # Browse/Home sections
│       └── core.ht           # Update checker & support info
└── example/                  # Flutter test app
```

---

## API Reference

This plugin uses the [Tidal API v2](https://developer.tidal.com/documentation).

| Endpoint | Tidal API |
|----------|-----------|
| Auth     | OAuth2 PKCE / `https://login.tidal.com/oauth2` |
| Search   | `GET /v2/search` |
| Tracks   | `GET /v2/tracks/{id}` |
| Albums   | `GET /v2/albums/{id}` |
| Artists  | `GET /v2/artists/{id}` |
| Playlists | `GET /v2/playlists/{id}` |
| User     | `GET /v2/me` |

---

## License

MIT © ManitnjG
