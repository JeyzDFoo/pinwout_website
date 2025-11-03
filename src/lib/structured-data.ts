export const organizationSchema = {
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "PinWout Venture Corp",
  "alternateName": "PinWout VC",
  "description": "Calgary-based Micro-Angel investment fund transforming small inputs into powerful results through strategic early-stage technology investments.",
  "url": "https://pinwout-bd900.web.app",
  "logo": "https://pinwout-bd900.web.app/logo.png",
  "foundingDate": "2023",
  "slogan": "Power In, Work Out",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Calgary",
    "addressRegion": "Alberta",
    "addressCountry": "Canada"
  },
  "contactPoint": {
    "@type": "ContactPoint",
    "email": "hello@pinwout.com",
    "contactType": "General Inquiry"
  },
  "sameAs": [
    "https://www.opper.dev"
  ],
  "founder": [
    {
      "@type": "Person",
      "name": "Jeremy Parker",
      "jobTitle": "CEO"
    },
    {
      "@type": "Person", 
      "name": "Jonathan Johnson",
      "jobTitle": "CMO"
    }
  ],
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Investment Portfolio",
    "itemListElement": [
      {
        "@type": "Service",
        "name": "Opper",
        "description": "Simplified prioritization. Faster progression."
      },
      {
        "@type": "Service", 
        "name": "Gravity",
        "description": "Sustainable Energy Storage for Today's Grids"
      },
      {
        "@type": "Service",
        "name": "Unpanic", 
        "description": "A system designed to help people with Complex PTSD identify and overcome their triggers and flashbacks for good"
      }
    ]
  }
};

export const websiteSchema = {
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "PinWout Venture Corp",
  "url": "https://pinwout-bd900.web.app",
  "description": "Calgary-based Micro-Angel investment fund",
  "publisher": {
    "@type": "Organization",
    "name": "PinWout Venture Corp"
  }
};