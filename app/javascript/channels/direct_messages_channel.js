import consumer from "./consumer";

window.addEventListener("turbolinks:load", () => {
  const messagesContainer = document.getElementById("messages");

  if (messagesContainer) {
    const alert = document.getElementById("new-message-alert");
    const id = messagesContainer.dataset.directMessageId;
    const channelDetails = {
      channel: "DirectMessagesChannel",
      id
    };

    consumer.subscriptions.create(channelDetails, {
      received(data) {
        messagesContainer.insertAdjacentHTML("beforeend", data);
        alert.classList.remove("hidden");
      }
    });
  }
});
