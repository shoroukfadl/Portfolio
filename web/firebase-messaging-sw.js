// firebase-messaging-sw.js
importScripts('https://www.gstatic.com/firebasejs/10.7.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyBkaLW3pW47RepTJ1z8boG_N0SSvbjxoD4",
  authDomain: "rocklisnotify.firebaseapp.com",
  projectId: "rocklisnotify",
  storageBucket: "rocklisnotify.appspot.com",
  messagingSenderId: "381464266397",
  appId: "1:381464266397:web:280eb7386490f112c2b674"
});

const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage(function(payload) {
  console.log('Received background message:', payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: payload.notification.icon || '/icon.png',
    // Add more options as needed
  };

  return self.registration.showNotification(notificationTitle, notificationOptions);
});

// Optional: Handle notification clicks
self.addEventListener('notificationclick', function(event) {
  event.notification.close();

  // Add custom click handling here
  event.waitUntil(
    clients.openWindow('/')
  );
});