const flume = require('@gameflow-tv/flume/dist/tailwind');

const { theme, plugins } = flume.getConfig();

/** @type {import('tailwindcss').Config} */
module.exports = {
  mode: 'jit',
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  corePlugins: {
    preflight: false,
  },
  theme: {
    ...theme,
    extend: {
      screens: {
        ...theme.extend.screens,
        '3xl': '1920px',
      },
      backgroundImage: {
        ...theme.extend.backgroundImage,
        'gradient-card':
          'linear-gradient(180deg, var(--gradient-start) 0%, var(--gradient-end) 100%), var(--card-url)',
      },
      ...theme.extend,
      animation: {
        ...theme.extend.animation,
        appear: `translate 0.5s ${theme.transitionTimingFunction.default}, fade 0.5s ${theme.transitionTimingFunction.default}`,
        'appear-slow': `translate ${theme.transitionDuration.long} ${theme.transitionTimingFunction.default}, fade ${theme.transitionDuration.long} ${theme.transitionTimingFunction.default}`,
        'marquee-slide':
          'slide-start var(--marquee-duration) linear 0s 1 normal none, slide-loop calc(var(--marquee-duration) * 2) linear var(--marquee-duration) infinite normal none',
        'marquee-fake-slide':
          'slide-fake-loop calc(var(--marquee-duration) * 2) linear 0s infinite normal none',
        'appear-bottom': `slide-from-bottom ${theme.transitionDuration.long} ${theme.transitionTimingFunction.default}, fade ${theme.transitionDuration.long} ${theme.transitionTimingFunction.default}`,
      },
      keyframes: {
        fade: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        translate: {
          '0%': { transform: 'translateY(30%)' },
          '100%': { transform: 'translateY(0)' },
        },
        'slide-start': {
          '0%': { transform: '0px' },
          '100%': { transform: 'translateX(-100%)' },
        },
        'slide-loop': {
          '0%': { transform: 'translateX(100%)' },
          '100%': { transform: 'translateX(-100%)' },
        },
        'slide-fake-loop': {
          '0%': { transform: 'translateX(0)' },
          '100%': { transform: 'translateX(-200%)' },
        },
        'slide-from-bottom': {
          '0%': { transform: 'translateY(50%)' },
          '100%': { transform: 'translateY(0)' },
        },
      },
    },
  },
  plugins,
};
