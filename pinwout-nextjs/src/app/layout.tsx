import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Header } from "@/components/Header";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "PinWout Venture Corp - Power In, Work Out",
  description: "Transform small inputs into powerful results. Alberta's fastest growing tech company building Opper productivity app and Gravity energy storage.",
  keywords: "productivity app, energy storage, tech startup, Calgary, Alberta, Canada",
  authors: [{ name: "PinWout Venture Corp" }],
  creator: "PinWout Venture Corp",
  publisher: "PinWout Venture Corp",
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://pinwout.com",
    title: "PinWout Venture Corp - Power In, Work Out",
    description: "Transform small inputs into powerful results",
    siteName: "PinWout Venture Corp",
  },
  twitter: {
    card: "summary_large_image",
    title: "PinWout Venture Corp",
    description: "Power In, Work Out - Transform small inputs into powerful results",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="scroll-smooth">
      <body className={`${inter.variable} antialiased`}>
        <Header />
        <main>
          {children}
        </main>
      </body>
    </html>
  );
}
