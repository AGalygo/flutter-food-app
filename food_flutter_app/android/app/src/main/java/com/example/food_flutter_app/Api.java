package com.example.food_flutter_app;

import retrofit2.Call;
import retrofit2.http.GET;

public interface Api {
    @GET("random")
    Call<RandomAnswer> getRandomPic();
}
