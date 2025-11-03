import React from 'react';
import Link from 'next/link';
import { PinWoutLogo } from '@/components/ui/Logo';
import { Container } from '@/components/ui/Container';

const Footer: React.FC = () => {
  const quickLinks = [
    { name: 'Opper', href: '/opper' },
    { name: 'Gravity', href: '/gravity' },
    { name: 'Team', href: '/team' },
    { name: 'Contact', href: '/contact' },
  ];

  const products = [
    { name: 'Opper App', href: 'https://www.opper.dev' },
    { name: 'Gravity Whitepaper', href: '/gravity#whitepaper' },
  ];

  return (
    <footer className="gradient-footer text-neutral-beige">
      <Container>
        <div className="py-12">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            {/* Company Info */}
            <div className="md:col-span-2">
              <div className="flex items-center mb-4">
                <PinWoutLogo size={40} />
                <div className="ml-3">
                  <h3 className="font-bold text-lg text-white">PinWout Venture Corp</h3>
                  <p className="text-sm opacity-80">Power In, Work Out</p>
                </div>
              </div>
              <p className="text-sm opacity-90 mb-4 max-w-md">
                Transforming small inputs into powerful results. Based in Calgary, Alberta, Canada.
              </p>
              <p className="text-xs opacity-70">
                © {new Date().getFullYear()} PinWout Venture Corp. All rights reserved.
              </p>
            </div>

            {/* Quick Links */}
            <div>
              <h4 className="font-semibold text-white mb-4">Company</h4>
              <ul className="space-y-2">
                {quickLinks.map((link) => (
                  <li key={link.name}>
                    <Link 
                      href={link.href}
                      className="text-sm opacity-80 hover:opacity-100 hover:text-accent-golden transition-colors duration-200"
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            {/* Products */}
            <div>
              <h4 className="font-semibold text-white mb-4">Products</h4>
              <ul className="space-y-2">
                {products.map((product) => (
                  <li key={product.name}>
                    <Link 
                      href={product.href}
                      className="text-sm opacity-80 hover:opacity-100 hover:text-accent-golden transition-colors duration-200"
                      target={product.href.startsWith('http') ? '_blank' : '_self'}
                    >
                      {product.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Bottom bar */}
          <div className="border-t border-primary-blue/20 mt-8 pt-8">
            <div className="flex flex-col md:flex-row justify-between items-center text-xs opacity-70">
              <p>Proudly founded and located in Calgary, Alberta, Canada 🇨🇦</p>
              <div className="flex space-x-4 mt-4 md:mt-0">
                <Link href="/privacy" className="hover:text-accent-golden transition-colors duration-200">
                  Privacy Policy
                </Link>
                <Link href="/terms" className="hover:text-accent-golden transition-colors duration-200">
                  Terms of Service
                </Link>
              </div>
            </div>
          </div>
        </div>
      </Container>
    </footer>
  );
};

export { Footer };