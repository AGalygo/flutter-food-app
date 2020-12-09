package com.example.food_flutter_app;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class NetworkService {

    private static final String BASE_URL = "https://dog.ceo/api/breeds/image/";
    private static NetworkService instance;
    private Retrofit retrofit;


    private NetworkService() {
        retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public static NetworkService getInstance() {
        if (instance == null) {
            instance = new NetworkService();
        }
        return instance;
    }

    public void loadRandomPicAddress(Callback callback) {
        retrofit.create(Api.class).getRandomPic().enqueue(new retrofit2.Callback<RandomAnswer>() {
            @Override
            public void onResponse(Call<RandomAnswer> call, Response<RandomAnswer> response) {
                callback.onResponse(response.body().message);
            }

            @Override
            public void onFailure(Call<RandomAnswer> call, Throwable t) {

            }
        });
    }

    interface Callback {
        void onResponse(String path);
    }
}