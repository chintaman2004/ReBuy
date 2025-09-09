# ReBuy (Flutter + GetX) + MongoDB (Node/Express)

This project includes:
- Flutter app (GetX architecture, screens per your mock)
- Minimal Node/Express API that connects to your MongoDB Atlas using your credentials.
- The Flutter app calls the API for products & orders.

## Run backend first
```bash
cd server
npm install
node app.js
```
The server uses your provided connection string and creates `rebuy` database with `products` & `orders` collections.

## Run Flutter app
```bash
cd rebuy
flutter pub get
flutter run
```

If you're on Android emulator, `.env` already points to `http://10.0.2.2:4445`.
On real device, change `API_BASE_URL` in `.env` to your PC's LAN IP and keep port 4445.
