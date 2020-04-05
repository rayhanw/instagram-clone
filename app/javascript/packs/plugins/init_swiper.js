import Swiper from "swiper";
import "swiper/css/swiper.min.css";

const swiperContainers = document.querySelectorAll(".swiper-container");

swiperContainers.forEach(container => {
  const options = {
    pagination: {
      el: ".swiper-pagination"
    }
  };

  new Swiper(container, options);
});
