<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chatbot</title>
        <!--<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    </head>
    <body>
        <div id="chatbot-icon" onclick="toggleChat()">
            <i class="fas fa-comments"></i>
        </div>

        <div id="chat-container">
            <div id="chat-header">
                <span>Chatbot Hỗ Trợ Mua Hàng</span>
                <button onclick="toggleChat()">✖</button>
            </div>
            <div id="chat-box"></div>
            <div id="chat-input-area">
                <input type="text" id="user-input" placeholder="Nhập tin nhắn...">
                <button onclick="sendMessage()">Gửi</button>
            </div>
        </div>

        <style>
            * {
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif;
            }

            #chatbot-icon {
                position: fixed;
                bottom: 20px;
                right: 20px;
                background: linear-gradient(135deg, #ff6200, #ff8c00);
                color: white;
                width: 60px;
                height: 60px;
                font-size: 28px;
                text-align: center;
                line-height: 60px;
                border-radius: 50%;
                cursor: pointer;
                box-shadow: 0 4px 15px rgba(255, 98, 0, 0.4);
                transition: transform 0.3s, box-shadow 0.3s;
            }

            #chatbot-icon:hover {
                transform: scale(1.1);
                box-shadow: 0 6px 20px rgba(255, 98, 0, 0.6);
            }

            #chatbot-icon:hover {
                transform: scale(1.1);
                box-shadow: 0 6px 20px rgba(255, 98, 0, 0.6);
            }

            #chat-container {
                display: none;
                position: fixed;
                bottom: 90px;
                right: 20px;
                width: 380px;
                background: #fff;
                border-radius: 15px;
                box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
                overflow: hidden;
                animation: slideIn 0.3s ease-in-out;
            }

            @keyframes slideIn {
                from {
                    transform: translateY(50px);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            #chat-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: linear-gradient(135deg, #ff6200, #ff8c00);
                color: white;
                padding: 10px 15px;
                font-weight: 500;
                border-radius: 15px 15px 0 0;
            }

            #chat-header span {
                font-size: 18px;
            }

            #chat-header button {
                background: none;
                border: none;
                color: white;
                font-size: 16px;
                cursor: pointer;
                padding: 0;
                width: 20px;
                transition: color 0.3s;
            }

            #chat-header button:hover {
                color: #ff4d4d;
            }

            #chat-box {
                height: 300px;
                overflow-y: auto;
                padding: 15px;
                background: #f8f9fa;
                border-bottom: 1px solid #e0e0e0;
            }

            .user-message, .bot-message {
                margin-bottom: 10px;
                padding: 10px 15px;
                border-radius: 10px;
                max-width: 80%;
                word-wrap: break-word;
            }

            .user-message {
                text-align: left;
                color: #fff;
                background: #ff6200;
                margin-left: auto;
            }

            .bot-message {
                text-align: left;
                color: #333;
                background: #e9ecef;
                margin-right: auto;
            }

            #chat-input-area {
                display: flex;
                padding: 10px;
                background: #fff;
            }

            #user-input {
                flex: 1;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 20px;
                outline: none;
                margin-right: 10px;
                transition: border-color 0.3s;
            }

            #user-input:focus {
                border-color: #ff6200;
            }

            #chat-input-area button {
                padding: 10px 20px;
                background: #ff6200;
                color: white;
                border: none;
                border-radius: 20px;
                cursor: pointer;
                transition: background 0.3s;
            }

            #chat-input-area button:hover {
                background: #e05500;
            }

            .suggestion {
                text-align: center;
                color: #666;
                font-size: 14px;
                margin-bottom: 10px;
                background: #fff3e0;
                padding: 8px;
                border-radius: 10px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .suggestion:hover {
                background: #ffe0b2;
            }
        </style>

        <!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
        <script>
                    let isFirstOpen = true;

                    function toggleChat() {
                        $("#chat-container").toggle();
                        if (isFirstOpen && $("#chat-container").is(":visible")) {
                            showSuggestions();
                            isFirstOpen = false;
                        }
                    }

                    function showSuggestions() {
                        $("#chat-box").html(`
                    <div class="suggestion" onclick="sendSuggestion('Bạn có sản phẩm nào mới không?')">Bạn có sản phẩm nào mới không?</div>
                    <div class="suggestion" onclick="sendSuggestion('Chính sách bảo hành ra sao?')">Chính sách bảo hành ra sao?</div>
                    <div class="suggestion" onclick="sendSuggestion('Tôi muốn đặt hàng, làm thế nào?')">Tôi muốn đặt hàng, làm thế nào?</div>
                `);
                    }

                    function sendSuggestion(message) {
                        $("#chat-box").empty(); // Xóa gợi ý khi chọn
                        $("#chat-box").append('<div class="user-message">' + message + '</div>');
                        $.post("chatbot", {message: message}, function (response) {
                            if (response.error) {
                                $("#chat-box").append('<div class="bot-message">Lỗi: ' + response.error + '</div>');
                            } else {
                                $("#chat-box").append('<div class="bot-message"><b>Chatbot:</b> ' + response.reply + '</div>');
                            }
                            $("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
                        }, "json").fail(function (jqXHR, textStatus, errorThrown) {
                            $("#chat-box").append('<div class="bot-message">Chatbot không phản hồi! Lỗi: ' + textStatus + '</div>');
                            $("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
                        });
                    }

                    function sendMessage() {
                        let userInput = $("#user-input").val().trim();
                        if (userInput === "")
                            return;

                        $("#chat-box").append('<div class="user-message"><b>Bạn:</b> ' + userInput + '</div>');
                        $("#user-input").val("");

                        $.post("chatbot", {message: userInput}, function (response) {
                            if (response.error) {
                                $("#chat-box").append('<div class="bot-message">Lỗi: ' + response.error + '</div>');
                            } else {
                                $("#chat-box").append('<div class="bot-message"><b>Chatbot:</b> ' + response.reply + '</div>');
                            }
                            $("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
                        }, "json").fail(function (jqXHR, textStatus, errorThrown) {
                            $("#chat-box").append('<div class="bot-message">Chatbot không phản hồi! Lỗi: ' + textStatus + '</div>');
                            $("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
                        });
                    }

                    // Gửi tin nhắn bằng phím Enter
                    $("#user-input").on("keypress", function (e) {
                        if (e.which === 13) { // Phím Enter
                            sendMessage();
                        }
                    });
        </script>
    </body>
</html>