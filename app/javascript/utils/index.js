export const removeImageClasses = (image, newClasses = "mb-6 w-full") => {
  image.className = "";
  image.className = newClasses;
};
