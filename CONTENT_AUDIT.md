# Content Audit & Architecture Document
**PinWout Website Migration - Next.js Implementation**

*Created: November 3, 2025*  
*Technology: Next.js 14 + React + TypeScript + Tailwind CSS*

---

## 📋 Complete Content Extraction

### 🏠 Homepage Content Structure

#### Hero Section
```
Primary Headline: "PinWout Venture Corp."
Tagline: "Power In, Work Out"
Mission Statement: "We transform small inputs into powerful results, focusing on efficiency and impact. With our flagship app, Opper, we are redefining how business operate. As one of Alberta's fastest growing tech companies, we are strategically positioning ourselves to be a sustainable, decentralized, and diversified technology company."
```

#### Company Description
```
Core Message: "We transform small inputs into powerful results, focusing on efficiency and impact."
Location: "PinWout is proudly founded and located in Calgary, Alberta, Canada."
Vision: "With everything we build, our mission is to turn what's already available into something much greater."
Philosophy: "Power in. Work out."
```

### 🚀 Product Sections

#### Opper Product
```
Logo: Custom OpperLogo component
Tagline: "Simplified prioritization. Faster progression."
Website: www.opper.dev
App Store: Available (app_stores.png badge)

Features (4-card grid):
1. "Align your organization."
   - "Your company is the most effective when everyone is rowing in the same diretion. Opper measures and quantifies how well aligned your team is, and provides actionable insights to get everyone on the same page."

2. "Invisible intelligence."  
   - "Opper uses proven decision making frameworks and prioritization methods to bring data to your intuition and decision making. But you'd never know it. Opper's intelligence is designed to stay out of your way, so you can focus on that next high-impact to-do item."

3. "Mastered in seconds."
   - "Zero onboarding. Zero learning curve. Opper is intentionally designed to be mastered by anyone, anywhere in seconds. Because you're sick of overly complex project management and organization platforms. And so are we."

4. "Pared down prioritization."
   - "You provide an input, Opper intelligently quantifies your priorities with a 'score' that takes your perspective seriously. It's everything you need to make smarter decisions, and nothing you don't."
```

#### Gravity Product  
```
Title: "Gravity"
Subtitle: "Sustainable Energy Storage for Today's Grids"
Description: "Gravity is PinWout's approach to stabilizing energy grids using mountain gravity energy storage (MGES). By leveraging the natural force of gravity, this system stores excess renewable energy during peak production and releases it during periods of high demand.

With an emphasis on efficiency and sustainability, Gravity offers a cost-effective, scalable alternative to traditional energy storage methods such as Pumped Hydro and chemical batteries such as the Tesla Megapack."

CTA: "Download Gravity Whitepaper"
Download URL: "https://firebasestorage.googleapis.com/v0/b/pinwout-bd900.firebasestorage.app/o/gravity_whitepaper_30-mar-2025.pdf?alt=media&token=14f6ba40-f986-4446-8f61-90453f37238b"
```

### 👥 Team Section

```
Section Title: "Who We Are"

Team Member 1:
Name: "Jeremy Parker"
Role: "Jeremy is a seasoned leader and engineer with expertise in process automation, software development, and machine learning. He most recently lead the technical development at ZeroSound Systems, transforming a hardware-enabled software concept into a globally commercialized product."
Image: "assets/images/jeremy.jpg"

Team Member 2: 
Name: "Jonathan Johnson"
Role: "JJ is a marketing leader with years of experience in SAAS and fintech startups. He recently grew Durable from 0 to a 15M Series A raise in 15 months, sat on the executive team at Bench Accounting, and has consulted multiple early-stage startups to successful acquisitions and VC raises."
Image: "assets/images/jonathan.png"
```

### 📧 Contact Section

```
Section Title: "Contact Us"
Form Fields:
- Email (required, with validation)
- Message: "How can we help you?" (multi-line)
Submit Button: "Submit"
Success Message: "Thank you, we will be in touch!"
```

---

## 🎨 Visual Assets Inventory

### Logos & Icons
- **PinWout Main Logo**: Custom painted logo (PinWoutLogoPainter)
- **Opper Logo**: Custom OpperLogo component with tagline option
- **Company Icon**: assets/images/pinwout_icon.png

### Images
- **jeremy.jpg**: Founder headshot (100x100px circular)
- **jonathan.png**: Co-founder headshot (100x100px circular)  
- **app_stores.png**: App store download badges
- **leaf_badge.png**: Environmental/sustainability badge
- **canadaflag.png**: Canada flag (unused in current design)

### Brand Colors (from colors.dart)
```css
:root {
  /* Primary Colors */
  --primary-blue: #00509e;        /* Deep Blue */
  --primary-green: #228b22;       /* Earthy Green */
  --primary-black: #000000;
  --primary-purple: #301934;      /* Deep Purple */
  
  /* Accent Colors */
  --accent-light-green: #90ee90;  /* Light Green */
  --accent-golden: #daa520;       /* Golden */
  --accent-beige: #f5f5dc;        /* Beige */
  
  /* Neutral Colors */
  --neutral-soft-white: #fafaf0;  /* Off-White */
  --neutral-dark-gray: #666666;   /* Dark Gray */
  --neutral-light-gray: #b0b0b0;  /* Light Gray */
  
  /* CMYK Colors */
  --cmyk-cyan: #00ffff;           /* Cyan */
  --cmyk-magenta: #ff00ff;        /* Magenta */ 
  --cmyk-yellow: #ffff00;         /* Yellow */
}
```

---

## 🏗 New Site Architecture

### URL Structure (SEO Optimized)
```
/ (Homepage)
├── Hero + Company Overview
├── Products Section (Opper + Gravity)
├── Team Section
└── Contact Form

/opper (Dedicated Product Page)
├── Product Hero
├── Features Grid (4 features)
├── Screenshots/Demo
├── App Store Links
└── Visit Website CTA

/gravity (Dedicated Product Page)
├── Technology Overview  
├── Technical Details
├── Sustainability Benefits
├── Whitepaper Download
└── Contact for More Info

/team (Detailed Team Page)
├── Company Story
├── Founder Profiles (expanded)
├── Company Values
└── Join Team CTA

/contact (Dedicated Contact Page)
├── Contact Form (enhanced)
├── Office Information
├── Social Media Links
└── Business Inquiries Info

/about (Company Details)
├── Company History
├── Mission & Vision
├── Location & Presence
└── News/Updates
```

### Navigation Structure
```
Header Navigation:
- Logo (links to /)
- Products → Dropdown (Opper, Gravity)  
- Team
- About
- Contact
- CTA Button: "Get Started" → /opper

Footer:
- Company Info
- Quick Links (Products, Team, Contact)
- Social Media
- Legal (Privacy, Terms)
- Copyright Notice
```

---

## 📱 Component Architecture (Next.js)

### Layout Components
```
components/
├── layout/
│   ├── Header.tsx           # Navigation + Logo
│   ├── Footer.tsx           # Footer with links
│   ├── Layout.tsx           # Wrapper component
│   └── Navigation.tsx       # Mobile/Desktop nav
├── ui/
│   ├── Button.tsx           # Reusable button component
│   ├── Card.tsx             # Product/team cards
│   ├── Container.tsx        # Max-width container
│   └── Section.tsx          # Page sections
├── sections/
│   ├── Hero.tsx             # Homepage hero
│   ├── ProductsOverview.tsx # Products grid
│   ├── TeamSection.tsx      # Team members
│   ├── ContactForm.tsx      # Contact form
│   └── AboutSection.tsx     # Company info
└── forms/
    ├── ContactForm.tsx      # Main contact form
    └── NewsletterSignup.tsx # Email signup (future)
```

### Page Structure (Next.js App Router)
```
app/
├── layout.tsx              # Root layout
├── page.tsx                # Homepage
├── opper/
│   └── page.tsx            # Opper product page
├── gravity/  
│   └── page.tsx            # Gravity product page
├── team/
│   └── page.tsx            # Team page
├── contact/
│   └── page.tsx            # Contact page
├── about/
│   └── page.tsx            # About page
└── globals.css             # Global styles
```

---

## 🔧 Technical Requirements

### Dependencies (package.json)
```json
{
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "typescript": "^5.0.0",
    "@types/react": "^18.0.0",
    "@types/react-dom": "^18.0.0",
    "tailwindcss": "^3.3.0",
    "framer-motion": "^10.0.0",
    "react-hook-form": "^7.45.0",
    "@hookform/resolvers": "^3.3.0",
    "zod": "^3.22.0",
    "lucide-react": "^0.290.0"
  },
  "devDependencies": {
    "eslint": "^8.0.0",
    "eslint-config-next": "^14.0.0",
    "prettier": "^3.0.0",
    "@types/node": "^20.0.0"
  }
}
```

### Environment Configuration
```env
# .env.local
NEXT_PUBLIC_GA_ID=G-XXXXXXXXXX
NEXT_PUBLIC_SITE_URL=https://pinwout.com
EMAIL_SERVICE_API_KEY=xxx
FORMSPREE_ENDPOINT=xxx
```

---

## 📊 SEO Strategy

### Meta Tags Template
```tsx
// Each page will have custom meta
export const metadata = {
  title: "Page Title | PinWout Venture Corp",
  description: "Page-specific description for SEO",
  keywords: "relevant, keywords, for, page",
  openGraph: {
    title: "Page Title",
    description: "Social media description", 
    url: "https://pinwout.com/page",
    siteName: "PinWout Venture Corp",
    images: [
      {
        url: "/og-image.jpg",
        width: 1200,
        height: 630,
        alt: "PinWout Venture Corp"
      }
    ]
  },
  twitter: {
    card: "summary_large_image",
    title: "Page Title",
    description: "Twitter description",
    images: ["/twitter-image.jpg"]
  }
}
```

### Structured Data (JSON-LD)
```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "PinWout Venture Corp",
  "description": "Transform small inputs into powerful results",
  "url": "https://pinwout.com",
  "logo": "https://pinwout.com/logo.png",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Calgary",
    "addressRegion": "Alberta", 
    "addressCountry": "Canada"
  },
  "foundingDate": "2023",
  "founders": [
    {
      "@type": "Person",
      "name": "Jeremy Parker"
    },
    {
      "@type": "Person", 
      "name": "Jonathan Johnson"
    }
  ]
}
```

---

## ✅ Content Migration Checklist

### Text Content
- [x] Hero section headline and tagline
- [x] Company mission and description  
- [x] Opper product details and features (4 cards)
- [x] Gravity product description and CTA
- [x] Team member bios and roles
- [x] Contact form labels and messaging
- [x] All button text and CTAs

### Visual Assets  
- [ ] Export and optimize jeremy.jpg
- [ ] Export and optimize jonathan.png
- [ ] Export app_stores.png badge
- [ ] Export leaf_badge.png
- [ ] Create favicon from pinwout_icon.png
- [ ] Recreate PinWout logo as SVG
- [ ] Recreate Opper logo as SVG
- [ ] Create Open Graph images (1200x630)

### Interactive Elements
- [ ] Contact form validation rules
- [ ] Analytics tracking events
- [ ] Download tracking for whitepaper
- [ ] External link handling (opper.dev)
- [ ] App store link integration

### SEO Elements
- [ ] Page titles for all routes
- [ ] Meta descriptions for all pages
- [ ] Keywords for each page
- [ ] Open Graph tags
- [ ] Twitter card tags
- [ ] Structured data markup

---

**Status: Content audit complete ✅**  
**Next: Design System & Branding extraction**  
**Ready for: Next.js project initialization**