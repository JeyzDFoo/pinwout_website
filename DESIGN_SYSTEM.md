# Design System & Branding
**PinWout Website - Next.js Implementation**

*Created: November 3, 2025*  
*Based on: Flutter app design system extraction*

---

## 🎨 Brand Identity

### Logo System

#### Primary Logo - PinWout
The PinWout logo consists of **three sine wave curves** representing the transformation concept:
- **Yellow Wave**: `#ffff00` with 150 alpha (top curve, inverted)
- **Cyan Wave**: `#00ffff` with 180 alpha (middle curve)  
- **Magenta Wave**: `#ff00ff` with 150 alpha (bottom curve, inverted)
- **Background**: Black rounded rectangle
- **Stroke Weight**: Responsive (iconSize/10, min 2px, max 100px)

**SVG Implementation:**
```svg
<svg width="100" height="100" viewBox="0 0 100 100">
  <rect width="100" height="100" rx="10" fill="#000000"/>
  <path d="M10,30 Q30,10 50,30 Q70,50 90,30" 
        stroke="#ffff00" stroke-width="4" fill="none" 
        stroke-linecap="round" opacity="0.6"/>
  <path d="M10,50 Q30,70 50,50 Q70,30 90,50" 
        stroke="#00ffff" stroke-width="4" fill="none" 
        stroke-linecap="round" opacity="0.7"/>
  <path d="M10,70 Q30,90 50,70 Q70,50 90,70" 
        stroke="#ff00ff" stroke-width="4" fill="none" 
        stroke-linecap="round" opacity="0.6"/>
</svg>
```

#### Secondary Logo - Opper
- Custom typography-based logo
- Includes optional tagline: "Simplified prioritization. Faster progression."
- Color: Matches PinWout brand colors

### Logo Usage Guidelines
- **Minimum Size**: 32px for digital, 0.5 inch for print
- **Clear Space**: 1/2 logo width on all sides  
- **Backgrounds**: Works best on dark backgrounds
- **Variations**: Icon-only, logo + text, logo + tagline

---

## 🌈 Color Palette

### Primary Colors
```css
:root {
  /* Brand Primaries */
  --primary-blue: #00509e;        /* Deep Blue - Main brand color */
  --primary-green: #228b22;       /* Earthy Green - Secondary brand */
  --primary-black: #000000;       /* Pure Black - Text/backgrounds */
  --primary-purple: #301934;      /* Deep Purple - Accent */
  
  /* CMYK Logo Colors */
  --logo-cyan: #00ffff;           /* Cyan - Logo element */
  --logo-magenta: #ff00ff;        /* Magenta - Logo element */
  --logo-yellow: #ffff00;         /* Yellow - Logo element */
  
  /* Accent & Supporting */
  --accent-golden: #daa520;       /* Golden - CTAs and links */
  --accent-light-green: #90ee90;  /* Light Green - Success states */
  --neutral-beige: #f5f5dc;       /* Beige - Light text on dark */
  --neutral-soft-white: #fafaf0;  /* Soft White - Backgrounds */
  
  /* Grays */
  --gray-dark: #666666;           /* Dark Gray - Secondary text */
  --gray-light: #b0b0b0;          /* Light Gray - Borders */
  --gray-lighter: #f8f9fa;        /* Very Light Gray - Backgrounds */
}
```

### Color Usage Guidelines
- **Primary Blue**: Headers, navigation, primary buttons
- **Primary Green**: Success states, environmental themes, Gravity product
- **Primary Purple**: Cards, product highlights, gradients
- **Golden**: Links, CTAs, hover states, download buttons
- **Beige**: Text on dark backgrounds, form labels
- **Black**: Main text, logo backgrounds, high contrast elements

### Gradient Combinations (from Flutter)
```css
/* Header Gradient */
.gradient-header {
  background: linear-gradient(180deg, #000000 0%, #00509e 100%);
}

/* Team Section Gradient */  
.gradient-team {
  background: linear-gradient(180deg, #228b22 0%, #00509e 100%);
}

/* Footer Gradient */
.gradient-footer {
  background: linear-gradient(180deg, #00509e 0%, #301934 100%);
}
```

---

## 📝 Typography System

### Font Stack
```css
/* Primary Font Family - From Flutter "Comic" */
:root {
  --font-primary: "Comic Neue", "Comic Sans MS", "Marker Felt", cursive;
  --font-secondary: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  --font-monospace: "SF Mono", Monaco, "Cascadia Code", monospace;
}
```

**Note**: Consider upgrading from "Comic" to a more professional font:
- **Option 1**: Keep brand personality with "Comic Neue" (cleaner Comic Sans)
- **Option 2**: Modern sans-serif like "Inter" or "Poppins" for professionalism
- **Option 3**: Custom brand font for unique identity

### Typography Scale
```css
/* Heading Hierarchy */
.text-h1 { font-size: 2.5rem; font-weight: 700; line-height: 1.2; }    /* 40px */
.text-h2 { font-size: 2rem; font-weight: 600; line-height: 1.3; }      /* 32px */
.text-h3 { font-size: 1.5rem; font-weight: 600; line-height: 1.4; }    /* 24px */
.text-h4 { font-size: 1.25rem; font-weight: 500; line-height: 1.4; }   /* 20px */
.text-h5 { font-size: 1.125rem; font-weight: 500; line-height: 1.4; }  /* 18px */

/* Body Text */
.text-lg { font-size: 1.125rem; line-height: 1.6; }   /* 18px - Large body */
.text-base { font-size: 1rem; line-height: 1.6; }     /* 16px - Default body */
.text-sm { font-size: 0.875rem; line-height: 1.5; }   /* 14px - Small text */
.text-xs { font-size: 0.75rem; line-height: 1.4; }    /* 12px - Captions */

/* Font Weights */
.font-light { font-weight: 300; }
.font-normal { font-weight: 400; }
.font-medium { font-weight: 500; }
.font-semibold { font-weight: 600; }
.font-bold { font-weight: 700; }
```

### Typography Usage
- **H1**: Page titles, main hero headlines
- **H2**: Section headers ("Who We Are", "What is PinWout?")  
- **H3**: Product names ("Opper", "Gravity")
- **H4**: Feature card titles
- **Body Large**: Hero descriptions, important content
- **Body**: Standard paragraph text, feature descriptions
- **Small**: Form labels, captions, metadata

---

## 📱 Responsive Design System

### Breakpoints (Tailwind CSS)
```css
/* Mobile First Approach */
:root {
  --breakpoint-sm: 640px;   /* Small devices (phones) */
  --breakpoint-md: 768px;   /* Medium devices (tablets) */
  --breakpoint-lg: 1024px;  /* Large devices (desktops) */
  --breakpoint-xl: 1280px;  /* Extra large devices */
  --breakpoint-2xl: 1536px; /* 2X large devices */
}
```

### Container System
```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}

@media (min-width: 640px) {
  .container { padding: 0 2rem; }
}

@media (min-width: 1024px) {
  .container { padding: 0 3rem; }
}
```

### Grid System
```css
/* From Flutter OpperGrid - Responsive 1-2 column layout */
.feature-grid {
  display: grid;
  gap: 1.5rem;
  grid-template-columns: 1fr;
}

@media (min-width: 768px) {
  .feature-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* Team Grid - Always 2 columns on larger screens */
.team-grid {
  display: grid;
  gap: 2rem;
  grid-template-columns: 1fr;
  max-width: 1200px;
}

@media (min-width: 768px) {
  .team-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
```

---

## 🧩 Component Design System

### Button Styles
```css
/* Primary Button */
.btn-primary {
  background: var(--primary-blue);
  color: white;
  padding: 0.75rem 1.5rem;
  border-radius: 0.5rem;
  font-weight: 600;
  transition: all 0.2s;
}

.btn-primary:hover {
  background: #003d7a;
  transform: translateY(-1px);
}

/* Secondary Button */
.btn-secondary {
  background: transparent;
  color: var(--accent-golden);
  border: 2px solid var(--accent-golden);
  padding: 0.75rem 1.5rem;
  border-radius: 0.5rem;
  font-weight: 600;
}

/* CTA Button */
.btn-cta {
  background: var(--accent-golden);
  color: var(--primary-black);
  padding: 1rem 2rem;
  border-radius: 0.5rem;
  font-weight: 700;
  font-size: 1.125rem;
}

/* Link Button */
.btn-link {
  color: var(--accent-golden);
  text-decoration: underline;
  transition: opacity 0.2s;
}

.btn-link:hover {
  opacity: 0.8;
}
```

### Card Components
```css
/* Product Feature Card (from OpperCard) */
.feature-card {
  background: var(--primary-purple);
  color: white;
  padding: 1.5rem;
  border-radius: 1rem;
  aspect-ratio: 2/1;
  display: flex;
  flex-direction: column;
}

.feature-card h4 {
  color: rgba(255, 255, 255, 0.87);
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.feature-card p {
  color: rgba(255, 255, 255, 0.63);
  flex-grow: 1;
}

/* Team Member Card */
.team-card {
  background: var(--primary-black);
  color: white;
  padding: 1.5rem;
  border-radius: 1rem;
  text-align: center;
  aspect-ratio: 1/1;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.team-card img {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 1rem;
}

.team-card h3 {
  color: white;
  font-weight: 600;
  margin-bottom: 0.75rem;
}

.team-card p {
  color: rgba(255, 255, 255, 0.78);
  font-size: 0.875rem;
  flex-grow: 1;
}
```

### Form Styles
```css
/* Input Fields (from contact form) */
.form-input {
  width: 100%;
  padding: 0.75rem;
  border: 2px solid var(--neutral-beige);
  border-radius: 0.5rem;
  background: transparent;
  color: var(--neutral-beige);
  font-size: 1rem;
}

.form-input:focus {
  outline: none;
  border-color: var(--accent-golden);
  box-shadow: 0 0 0 3px rgba(218, 165, 50, 0.1);
}

.form-label {
  color: var(--neutral-beige);
  font-weight: 500;
  margin-bottom: 0.5rem;
  display: block;
}

/* Textarea */
.form-textarea {
  resize: vertical;
  min-height: 120px;
}
```

---

## 🎭 Animation & Motion

### Transitions
```css
/* Standard Transitions */
:root {
  --transition-fast: 0.15s ease;
  --transition-normal: 0.2s ease;
  --transition-slow: 0.3s ease;
}

/* Hover Effects */
.hover-lift {
  transition: transform var(--transition-normal);
}

.hover-lift:hover {
  transform: translateY(-2px);
}

.hover-glow {
  transition: box-shadow var(--transition-normal);
}

.hover-glow:hover {
  box-shadow: 0 10px 30px rgba(0, 80, 158, 0.3);
}
```

### Micro-interactions (Framer Motion)
```javascript
// Button tap animation
const buttonVariants = {
  tap: { scale: 0.98 },
  hover: { scale: 1.02 }
}

// Card entrance animation  
const cardVariants = {
  hidden: { opacity: 0, y: 20 },
  visible: { 
    opacity: 1, 
    y: 0,
    transition: { duration: 0.3 }
  }
}

// Stagger children animation
const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.1
    }
  }
}
```

---

## 🖼 Asset Guidelines

### Image Specifications
```
Logo Assets:
- SVG format for scalability
- PNG fallback (minimum 512x512px)
- Favicon: 32x32, 16x16 ICO format

Team Photos:
- Format: WebP with JPEG fallback
- Size: 400x400px minimum (1:1 aspect ratio)  
- Optimization: <100KB per image
- Alt text: "Name, Title at PinWout"

Product Images:
- App store badges: PNG, 2x resolution
- Screenshots: WebP format, responsive sizes
- Icons: SVG preferred, 24x24px base size

Background Images:
- Format: WebP with JPEG fallback
- Optimization: <500KB
- Responsive: Multiple sizes (mobile, tablet, desktop)
```

### Icon System
```css
/* Icon sizing scale */
.icon-xs { width: 16px; height: 16px; }
.icon-sm { width: 20px; height: 20px; }
.icon-base { width: 24px; height: 24px; }
.icon-lg { width: 32px; height: 32px; }
.icon-xl { width: 48px; height: 48px; }

/* Icon colors */
.icon-primary { color: var(--primary-blue); }
.icon-success { color: var(--accent-light-green); }
.icon-accent { color: var(--accent-golden); }
.icon-muted { color: var(--gray-dark); }
```

---

## 📐 Layout & Spacing

### Spacing Scale (Tailwind-based)
```css
:root {
  --space-xs: 0.25rem;    /* 4px */
  --space-sm: 0.5rem;     /* 8px */
  --space-base: 1rem;     /* 16px */
  --space-lg: 1.5rem;     /* 24px */
  --space-xl: 2rem;       /* 32px */
  --space-2xl: 3rem;      /* 48px */
  --space-3xl: 4rem;      /* 64px */
  --space-4xl: 6rem;      /* 96px */
}
```

### Section Spacing (from Flutter layout)
```css
.section {
  padding: var(--space-3xl) 0; /* 64px top/bottom */
}

@media (min-width: 768px) {
  .section {
    padding: var(--space-4xl) 0; /* 96px top/bottom */
  }
}

.section-inner {
  padding: 0 var(--space-base); /* 16px sides on mobile */
}

@media (min-width: 768px) {
  .section-inner {
    padding: 0 var(--space-xl); /* 32px sides on desktop */
  }
}
```

---

## ♿ Accessibility Guidelines

### Color Contrast
- **Text on dark backgrounds**: Use `--neutral-beige` (#f5f5dc) - WCAG AA compliant
- **Text on light backgrounds**: Use `--primary-black` (#000000)
- **Link colors**: `--accent-golden` (#daa520) meets contrast requirements
- **Error states**: Use high contrast red (#dc2626)

### Focus States
```css
.focus-visible {
  outline: 2px solid var(--accent-golden);
  outline-offset: 2px;
}

input:focus-visible,
button:focus-visible,
a:focus-visible {
  outline: 2px solid var(--accent-golden);
  outline-offset: 2px;
}
```

### Screen Reader Support
- All images have descriptive alt text
- Form labels properly associated with inputs
- Skip navigation links for keyboard users
- Semantic HTML structure (h1, h2, h3 hierarchy)
- ARIA labels for interactive elements

---

## 📱 Mobile-First Considerations

### Touch Targets
```css
/* Minimum 44x44px touch targets */
.touch-target {
  min-width: 44px;
  min-height: 44px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}
```

### Mobile Navigation
- Hamburger menu for mobile (<768px)
- Full navigation bar for desktop (≥768px)  
- Touch-friendly dropdown menus
- Swipe gestures for image galleries

### Performance Considerations
- Images: WebP format with JPEG fallback
- Fonts: Subset fonts, preload critical fonts
- Icons: SVG sprite system for efficiency
- Critical CSS: Inline above-fold styles

---

## ✅ Design System Checklist

### Brand Elements
- [x] Logo system defined (PinWout + Opper)
- [x] Color palette extracted and organized
- [x] Typography hierarchy established  
- [x] Icon system planned

### Components
- [x] Button styles and states
- [x] Card component variations
- [x] Form input styles
- [x] Navigation components

### Responsive Design  
- [x] Breakpoint system defined
- [x] Grid system established
- [x] Mobile-first approach
- [x] Touch target guidelines

### Accessibility
- [x] Color contrast verified
- [x] Focus state styles
- [x] Screen reader considerations
- [x] Keyboard navigation support

---

**Status: Design System complete ✅**  
**Next: Project Setup & Environment**  
**Ready for: Next.js implementation**