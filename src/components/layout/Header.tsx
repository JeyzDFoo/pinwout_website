'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { Menu, X } from 'lucide-react';
import { PinWoutLogoWithText } from '@/components/ui/Logo';
import { Button } from '@/components/ui/Button';
import { Container } from '@/components/ui/Container';

const Header: React.FC = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const navigation = [
    { name: 'Home', href: '/' },
    { name: 'Portfolio', href: '/#portfolio' },
    { name: 'Opper Beta', href: '/opper' },
    { name: 'Team', href: '/team' },
    { name: 'About', href: '/about' },
    { name: 'Contact', href: '/contact' },
  ];

  return (
    <header className="gradient-header sticky top-0 z-50">
      <Container>
        <div className="flex items-center justify-between py-4">
          {/* Logo */}
          <Link href="/" className="flex items-center">
            <PinWoutLogoWithText size={40} />
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            {navigation.map((item) => (
              <Link
                key={item.name}
                href={item.href}
                className="text-neutral-beige hover:text-accent-golden transition-colors duration-200 font-medium"
              >
                {item.name}
              </Link>
            ))}
          </nav>

          {/* Desktop CTA */}
          <div className="hidden md:flex">
            <Link href="/opper">
              <Button 
                variant="cta" 
                size="sm"
              >
                Contact Sales
              </Button>
            </Link>
          </div>

          {/* Mobile menu button */}
          <button
            className="md:hidden text-neutral-beige hover:text-accent-golden transition-colors duration-200"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            aria-label="Toggle menu"
          >
            {isMenuOpen ? (
              <X size={24} />
            ) : (
              <Menu size={24} />
            )}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="md:hidden border-t border-primary-blue/20 pt-4 pb-4">
            <nav className="flex flex-col space-y-4">
              {navigation.map((item) => (
                <Link
                  key={item.name}
                  href={item.href}
                  className="text-neutral-beige hover:text-accent-golden transition-colors duration-200 font-medium py-2"
                  onClick={() => setIsMenuOpen(false)}
                >
                  {item.name}
                </Link>
              ))}
              <div className="pt-4">
                <Link href="/opper" onClick={() => setIsMenuOpen(false)}>
                  <Button 
                    variant="cta" 
                    size="sm" 
                    className="w-full"
                  >
                    Contact Sales
                  </Button>
                </Link>
              </div>
            </nav>
          </div>
        )}
      </Container>
    </header>
  );
};

export { Header };