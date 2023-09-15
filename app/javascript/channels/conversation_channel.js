 import consumer from "./consumer"

consumer.subscriptions.create("ConversationChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        let currentUserId = $('#chatroom_data').data('current-user');
        let chatroomId = $('#chatroom_data').data('current-chatroom');
        let klass = currentUserId === data.id ? 'sent' : 'reply';
        if (currentUserId === data.id){
            $('#chat-text').val('');
        }
        if(chatroomId === data.conversation) {
            $('#msg-div').append(
                '<div class="'+ klass +'">' +
                '<div class="message">' +
                data.content +
                '</div>' +
                '<div class="user-name" style=" display: '+ data.style +'">' + data.username +  '</div>' +
                '</div>');
        }
        scroll_bottom()
    }
});
