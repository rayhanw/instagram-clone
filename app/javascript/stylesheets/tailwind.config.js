const { colors } = require("tailwindcss/defaultTheme");

module.exports = {
  theme: {
    colors: {
      ...colors,
      purple: {
        default: "#4d4c7d",
        darker: "#363062",
        light: "#827397",
        lighter: "#d8b9c3"
      },
      "light-gray": "#EDF2F7"
    }
  },
  variants: {},
  plugins: []
};
