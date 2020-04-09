export const removeImageClasses = (image, newClasses = "mb-6 w-full") => {
  image.className = "";
  newClasses.split(" ").forEach(className => {
    image.classList.add(className);
  });
};
