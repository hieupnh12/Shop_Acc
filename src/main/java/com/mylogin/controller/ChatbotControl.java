package com.mylogin.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet(name = "ChatbotControl", value = "/chatbot")
public class ChatbotControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String API_KEY = "AIzaSyBY9iSSP-JHkIr_k2XEEsy-g3bc6itN2uw"; // Thay bằng API Key thực tế
    private static final String GEMINI_API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=" + API_KEY;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userMessage = request.getParameter("message");

        if (userMessage == null || userMessage.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Message cannot be empty\"}");
            return;
        }

        String chatbotResponse = callGeminiAPI(userMessage);
        response.setContentType("application/json");
        response.getWriter().write(chatbotResponse);
    }

    private String callGeminiAPI(String message) {
        try {
            URL url = new URL(GEMINI_API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            // Định dạng JSON cho Gemini API
            String jsonInput = "{\"contents\": [{\"parts\": [{\"text\": \"" + message + "\"}]}]}";
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInput.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Đọc phản hồi từ Gemini API
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }

                // Trích xuất nội dung từ JSON
                String reply = extractReplyFromJson(response.toString());
                return "{\"reply\": \"" + escapeJson(reply) + "\"}";
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "{\"error\": \"Failed to connect to Gemini API: " + e.getMessage() + "\"}";
        }
    }

    // Hàm trích xuất nội dung text từ JSON của Gemini
    private String extractReplyFromJson(String jsonResponse) {
        try {
            JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();
            return jsonObject.getAsJsonArray("candidates")
                            .get(0).getAsJsonObject()
                            .getAsJsonObject("content")
                            .getAsJsonArray("parts")
                            .get(0).getAsJsonObject()
                            .get("text").getAsString();
        } catch (Exception e) {
            e.printStackTrace();
            return "Không thể phân tích phản hồi từ Gemini";
        }
    }

    // Hàm thoát ký tự đặc biệt để tránh lỗi JSON
    private String escapeJson(String text) {
        return text.replace("\"", "\\\"").replace("\n", "\\n");
    }
}