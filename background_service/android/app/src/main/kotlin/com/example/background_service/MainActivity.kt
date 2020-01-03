package com.example.background_service

import android.content.Intent
import android.os.Build
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    private val intentService by lazy { Intent(this, MyService::class.java) }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, "io.henrikhorbovyi.services")
                .setMethodCallHandler { call, result ->
                    if (call.method == "startService") {
                        startService()
                        result.success("[service started successfully]")
                    }
                }
    }

    override fun onDestroy() {
        super.onDestroy()
        stopService(intentService)
    }

    private fun startService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(intentService)
        } else {
            startService(intentService)
        }
    }

}
