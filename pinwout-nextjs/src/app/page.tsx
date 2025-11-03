'use client';

import { useEffect, useState } from 'react';
import { Users, Brain, Zap, Target, Mountain, Battery } from 'lucide-react';

export default function Home() {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    setIsVisible(true);
  }, []);

  return (
    <>
      {/* Hero Section */}
      <section className="section section-hero">
        <div className="container">
          <div className={`animate-fade-in-up ${isVisible ? '' : 'opacity-0'}`}>
            <h1 className="text-h1 mb-4">
              Power In, <span className="text-accent">Work Out</span>
            </h1>
            <p className="text-subtitle mb-6">
              We transform small inputs into powerful results, focusing on efficiency and impact.
            </p>
          </div>
        </div>
      </section>

      {/* Products Section */}
      <section id="products" className="section section-products">
        <div className="container">
          <div className={`animate-fade-in-up animate-delay-200 ${isVisible ? '' : 'opacity-0'}`}>
            <h2 className="text-h2 mb-6" style={{ textAlign: 'center' }}>Our Products</h2>
            
            {/* Opper Product */}
            <div className="product-section mb-6">
              <h3 className="text-h2 text-accent mb-3">Opper</h3>
              <p className="text-subtitle mb-3">
                Simplified prioritization. Faster progression.
              </p>
              <p className="text-body mb-6" style={{ opacity: 0.8, fontStyle: 'italic' }}>
                Opper beta round is currently closed. Sign up for the waitlist to get the latest news and early access.
              </p>
              
              <div className="grid grid-cols-auto mb-6">
                <div className="feature-card">
                  <div className="feature-icon">
                    <Users size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Align your organization.</h4>
                  <p className="text-body">
                    Your company is the most effective when everyone is rowing in the same direction. Opper measures and quantifies how well aligned your team is, and provides actionable insights to get everyone on the same page.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Brain size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Invisible intelligence.</h4>
                  <p className="text-body">
                    Opper uses proven decision making frameworks and prioritization methods to bring data to your intuition and decision making. But you'd never know it. Opper's intelligence is designed to stay out of your way.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Zap size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Mastered in seconds.</h4>
                  <p className="text-body">
                    Zero onboarding. Zero learning curve. Opper is intentionally designed to be mastered by anyone, anywhere in seconds. Because you're sick of overly complex project management platforms.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Target size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Pared down prioritization.</h4>
                  <p className="text-body">
                    You provide an input, Opper intelligently quantifies your priorities with a 'score' that takes your perspective seriously. It's everything you need to make smarter decisions, and nothing you don't.
                  </p>
                </div>
              </div>

              <a href="https://opper.dev" target="_blank" rel="noopener noreferrer" className="btn btn-secondary">
                Join Opper Waitlist
              </a>
            </div>

            {/* Gravity Product */}
            <div className="product-section">
              <h3 className="text-h2 text-accent mb-3">Gravity</h3>
              <p className="text-subtitle mb-6">
                Sustainable Energy Storage for Today's Grids
              </p>
              
              <div className="grid grid-cols-auto mb-6">
                <div className="feature-card">
                  <div className="feature-icon">
                    <Mountain size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Mountain Gravity Energy Storage</h4>
                  <p className="text-body">
                    Leveraging natural gravity forces to store excess renewable energy during peak production and release it during high demand periods.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Battery size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Cost-Effective & Scalable</h4>
                  <p className="text-body">
                    A sustainable alternative to traditional energy storage methods like Pumped Hydro and chemical batteries.
                  </p>
                </div>
              </div>

              <a 
                href="https://firebasestorage.googleapis.com/v0/b/pinwout-bd900.firebasestorage.app/o/gravity_whitepaper_30-mar-2025.pdf?alt=media&token=14f6ba40-f986-4446-8f61-90453f37238b" 
                target="_blank" 
                rel="noopener noreferrer" 
                className="btn btn-secondary"
              >
                Download Gravity Whitepaper
              </a>
            </div>
          </div>
        </div>
      </section>

      {/* About Section */}
      <section id="about" className="section section-cta">
        <div className="container">
          <div className={`animate-fade-in-up animate-delay-600 ${isVisible ? '' : 'opacity-0'}`}>
            <h2 className="text-h2 mb-4">What is PinWout?</h2>
            <p className="text-subtitle mb-6">
              PinWout is about maximizing efficiency and impact. We believe that with the right tools, 
              processes, and mindset, small inputs can generate extraordinary outputs.
            </p>
            <div className="grid grid-cols-2 mb-6">
              <div>
                <h3 className="text-h3 text-accent mb-2">Our Philosophy</h3>
                <p className="text-body">
                  Focus on what matters most. Eliminate waste. Amplify results through intelligent automation and decision-making frameworks.
                </p>
              </div>
              <div>
                <h3 className="text-h3 text-accent mb-2">Our Approach</h3>
                <p className="text-body">
                  We combine proven methodologies with cutting-edge technology to help organizations achieve more with less.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section className="section section-cta">
        <div className="container">
          <div className={`animate-fade-in-up ${isVisible ? '' : 'opacity-0'}`}>
            <h2 className="text-h2 mb-4">Ready to Get Started?</h2>
            <p className="text-subtitle mb-6">
              Transform your inputs into powerful results with PinWout.
            </p>
            <a href="mailto:hello@pinwout.com" className="btn btn-primary">
              Contact Us
            </a>
          </div>
        </div>
      </section>
    </>
  );
}
