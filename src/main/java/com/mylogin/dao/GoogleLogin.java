package com.mylogin.dao;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GoogleLogin {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // Tạo HttpClient
        CloseableHttpClient httpClient = HttpClients.createDefault();
        
        // Tạo POST request tới Google token endpoint
        HttpPost httpPost = new HttpPost(Iconstant.GOOGLE_LINK_GET_TOKEN);

        // Tạo danh sách tham số
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("client_id", Iconstant.GOOGLE_CLIENT_ID));
        params.add(new BasicNameValuePair("client_secret", Iconstant.GOOGLE_CLIENT_SECRET));
        params.add(new BasicNameValuePair("redirect_uri", Iconstant.GOOGLE_REDIRECT_URI));
        params.add(new BasicNameValuePair("code", code));
        params.add(new BasicNameValuePair("grant_type", Iconstant.GOOGLE_GRANT_TYPE));

        // Đặt tham số vào body của request
        httpPost.setEntity(new UrlEncodedFormEntity(params));

        // Thực thi request và lấy response
        try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
            String jsonResponse = EntityUtils.toString(response.getEntity());
            
            // Parse JSON bằng Gson
            JsonObject jobj = JsonParser.parseString(jsonResponse).getAsJsonObject();
            String accessToken = jobj.get("access_token").getAsString(); // Lấy access_token trực tiếp
System.out.println("Access Token: " + accessToken); // Debug
            return accessToken;
        } finally {
            httpClient.close(); // Đóng HttpClient
        }
    }
    
}