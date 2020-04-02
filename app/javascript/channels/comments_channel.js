import consumer from "./consumer";

window.addEventListener("turbolinks:load", () => {
  const commentsContainer = document.getElementById("comments");

  if (commentsContainer) {
    const id = commentsContainer.dataset.postId;
    const channelDetails = { channel: "CommentsChannel", id };

    consumer.subscriptions.create(channelDetails, {
      received(data) {
        // Called when there's incoming data on the websocket for this channel
        commentsContainer.insertAdjacentHTML("beforeend", data);
      }
    });
  }
});
