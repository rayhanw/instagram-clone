export const removeImageClasses = (image, newClass = "mb-6") => {
  image.className = "";
  image.classList.add(newClass);
};
