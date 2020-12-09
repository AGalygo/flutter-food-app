package com.example.food_flutter_app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;

import com.bumptech.glide.Glide;

public class AboutActivity extends AppCompatActivity {

    ImageView picture;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about);

        Button btnChange = findViewById(R.id.btnChangePic);
        btnChange.setOnClickListener(view -> {
            replacePicture();
        });

        picture = findViewById(R.id.ivAboutPic);
    }

    private void replacePicture() {
        NetworkService.getInstance().loadRandomPicAddress(path -> {
            Glide.with(this).load(path).into(picture);
        });
    }
}