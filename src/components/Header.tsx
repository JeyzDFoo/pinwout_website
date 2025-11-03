'use client';

import { useState, useEffect } from 'react';

export function Header() {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 50);
    };
    
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <header className={`header ${isScrolled ? 'header-scrolled' : ''}`}>
      <div className="container">
        <div className="header-content">
          {/* Logo */}
          <div className="logo">
            <span className="logo-text">
              Pin<span className="text-accent">Wout</span>
            </span>
          </div>

          {/* Desktop Navigation */}
          <nav className="nav-desktop">
            <a href="#portfolio" className="nav-link">Portfolio</a>
            <a href="#about" className="nav-link">About</a>
            <a href="mailto:hello@pinwout.com" className="btn btn-primary btn-sm">
              Contact
            </a>
          </nav>

          {/* Mobile Menu Button */}
          <button 
            className="mobile-menu-button"
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
            aria-label="Toggle mobile menu"
          >
            <span className={`hamburger ${isMobileMenuOpen ? 'hamburger-open' : ''}`}>
              <span></span>
              <span></span>
              <span></span>
            </span>
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMobileMenuOpen && (
          <nav className="nav-mobile">
            <a href="#portfolio" className="nav-link-mobile" onClick={() => setIsMobileMenuOpen(false)}>
              Portfolio
            </a>
            <a href="#about" className="nav-link-mobile" onClick={() => setIsMobileMenuOpen(false)}>
              About
            </a>
            <a href="mailto:hello@pinwout.com" className="btn btn-primary" onClick={() => setIsMobileMenuOpen(false)}>
              Contact
            </a>
          </nav>
        )}
      </div>
    </header>
  );
}