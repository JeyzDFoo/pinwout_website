import type { Config } from 'tailwindcss'

export default {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Brand Primary Colors
        'primary-blue': '#00509e',
        'primary-green': '#228b22', 
        'primary-black': '#000000',
        'primary-purple': '#301934',
        
        // CMYK Logo Colors
        'logo-cyan': '#00ffff',
        'logo-magenta': '#ff00ff',
        'logo-yellow': '#ffff00',
        
        // Accent Colors
        'accent-golden': '#daa520',
        'accent-light-green': '#90ee90',
        
        // Neutral Colors
        'neutral-beige': '#f5f5dc',
        'neutral-soft-white': '#fafaf0',
        'gray-dark': '#666666',
        'gray-light': '#b0b0b0',
        'gray-lighter': '#f8f9fa',
      },
      fontFamily: {
        // Keeping sans as default, but can be changed to Comic Neue later
        'sans': ['Inter', 'ui-sans-serif', 'system-ui'],
        'comic': ['Comic Neue', 'Comic Sans MS', 'Marker Felt', 'cursive'],
      },
      fontSize: {
        'h1': ['2.5rem', { lineHeight: '1.2', fontWeight: '700' }],
        'h2': ['2rem', { lineHeight: '1.3', fontWeight: '600' }],
        'h3': ['1.5rem', { lineHeight: '1.4', fontWeight: '600' }],
        'h4': ['1.25rem', { lineHeight: '1.4', fontWeight: '500' }],
        'h5': ['1.125rem', { lineHeight: '1.4', fontWeight: '500' }],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
      },
      aspectRatio: {
        'feature': '2 / 1',
      },
      animation: {
        'fade-in': 'fadeIn 0.3s ease-in-out',
        'slide-up': 'slideUp 0.3s ease-out',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { opacity: '0', transform: 'translateY(20px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
    },
  },
  plugins: [],
} satisfies Config