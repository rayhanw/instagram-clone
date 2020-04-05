import Swiper from "swiper";

const swiperContainers = document.querySelectorAll(".swiper-container");

swiperContainers.forEach(container => {
  const options = {
    pagination: {
      el: ".swiper-pagination"
    }
  };

  new Swiper(container, options);
});
