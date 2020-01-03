package com.example.background_service

import android.app.Notification
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.IBinder

class MyService : Service() {

    override fun onCreate() {
        super.onCreate()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val notification = Notification.Builder(this, BackgroundServiceApp.NOTIFICATION_CHANNEL)
                    .setContentTitle("Flutter background service")
                    .setContentText("This is running in background...")
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .build()

            startForeground(100, notification)
        }
    }

    override fun onBind(data: Intent?): IBinder? {
        return null
    }
}