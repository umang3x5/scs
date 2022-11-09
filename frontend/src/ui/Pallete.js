export const palette = {
  aBlack: {
    500: '#282829',
  },
  aWhite: {
    500: '#ffffff',
  },
  aRed: {
    100: '#fae4e5',
    300: '#fb8c8c',
    500: '#ed4747',
    600: '#e91c1c',
    700: '#c12929',
  },
  aGray: {
    50: '#fafafa',
    100: '#f2f2f2',
    200: '#e9e9e9',
    300: '#cccccc',
    500: '#999999',
    700: '#595959',
  },

  gray: {
    100: '#f2f2f2',
    300: '#cccccc',
    500: '#999999',
    700: '#595959',
  },
  blueGray: {
    100: '#93a4ad',
    300: '#647c8a',
    500: '#485a63',
    700: '#394c55',
  },
  indigo: {
    100: '#7986cb',
    300: '#3f51b5',
    500: '#303f9f',
    700: '#213092',
  },
  blue: {
    100: '#64b5f6',
    300: '#2196f3',
    500: '#1976d2',
    700: '#0a59a8',
  },
  lightBlue: {
    100: '#4fc3f7',
    300: '#03a9f4',
    500: '#0b8ed6',
    700: '#007fc5',
  },
  cyan: {
    100: '#4dd0e1',
    300: '#00bcd4',
    500: '#0097a7',
    700: '#258493',
  },
  teal: {
    100: '#4db6ac',
    300: '#049587',
    500: '#037b6d',
    700: '#006055',
  },
  green: {
    100: '#81c784',
    300: '#4caf50',
    500: '#388e3c',
    700: '#2e7d32',
  },
  lightGreen: {
    100: '#aed581',
    300: '#8bc34a',
    500: '#689f38',
    700: '#4f6f33',
  },
  lime: {
    100: '#dce775',
    300: '#cddc39',
    500: '#afb42b',
    700: '#8e9d01',
  },
  yellow: {
    100: '#fff176',
    300: '#ffeb3b',
    500: '#fbc02d',
    700: '#d07e04',
  },
  amber: {
    100: '#ffd54f',
    300: '#ffc107',
    500: '#ffa000',
    700: '#b38c2b',
  },
  orange: {
    100: '#ffb74d',
    300: '#ff9800',
    500: '#f57c00',
    700: '#bb661e',
  },
  brown: {
    100: '#a1887f',
    300: '#795548',
    500: '#5d4037',
    700: '#4e3229',
  },
  tangerine: {
    100: '#ff8a65',
    300: '#ff5722',
    500: '#e64a19',
    700: '#c0360a',
  },
  errorRed: {
    100: '#e57373',
    300: '#f44336',
    500: '#d32f2f',
    700: '#c62323',
  },
  pink: {
    100: '#f06292',
    300: '#e91e63',
    500: '#c2185b',
    700: '#b0104f',
  },
  purple: {
    100: '#ba68c8',
    300: '#9c27b0',
    500: '#7b1fa2',
    700: '#650e89',
  },
  violet: {
    100: '#9575cd',
    300: '#673ab7',
    500: '#512da8',
    700: '#341878',
  },
};

export const paletteToMui = (color) => ({
  main: color[500],
  light: color[300],
  dark: color[700],
});

export default palette;
