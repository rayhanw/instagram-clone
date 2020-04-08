import piexif from "piexifjs";

export const rotatePicture = (image, event) => {
  try {
    const exif = piexif.load(event.target.result);
    const orientationNumber = exif["0th"][piexif.ImageIFD.Orientation];
    if (orientationNumber) {
      image.classList.add(`orientation-${orientationNumber}`);
    }
  } catch (error) {
    console.log(error);
  }
};
