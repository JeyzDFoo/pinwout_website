import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Header } from "@/components/Header";
import { organizationSchema, websiteSchema } from "@/lib/structured-data";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  metadataBase: new URL('https://pinwout-bd900.web.app'),
  title: "PinWout Venture Corp - Micro-Angel Investment Fund | Calgary, AB",
  description: "Calgary-based Micro-Angel investment fund transforming small inputs into powerful results. Investing in early-stage technology companies across Alberta and Canada.",
  keywords: "micro-angel fund, venture capital, investment fund, tech startup, Calgary, Alberta, Canada, early-stage investing, Opper, Gravity, Unpanic",
  authors: [{ name: "PinWout Venture Corp" }],
  creator: "PinWout Venture Corp",
  publisher: "PinWout Venture Corp",
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://pinwout-bd900.web.app",
    title: "PinWout Venture Corp - Micro-Angel Investment Fund | Calgary, AB",
    description: "Calgary-based Micro-Angel investment fund transforming small inputs into powerful results",
    siteName: "PinWout Venture Corp",
  },
  twitter: {
    card: "summary_large_image",
    title: "PinWout Venture Corp",
    description: "Power In, Work Out - Transform small inputs into powerful results",
  },
  alternates: {
    canonical: "https://pinwout-bd900.web.app",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="scroll-smooth">
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(organizationSchema),
          }}
        />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(websiteSchema),
          }}
        />
      </head>
      <body className={`${inter.variable} antialiased`}>
        <Header />
        <main>
          {children}
        </main>
      </body>
    </html>
  );
}
