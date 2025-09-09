# ReBuy Hackathon Package

This ZIP contains:
- `rebuy/` (Flutter app)
- `server/` (Node.js API to connect to MongoDB Atlas using your creds)

**MongoDB URI** is embedded in `server/app.js` using your username & password.
Change the DB name/collections in `app.js` if needed.

## Quick Start
1) Start the server:
```
cd server
npm install
node app.js
```
2) Run the Flutter app:
```
cd rebuy
flutter pub get
flutter run
```
