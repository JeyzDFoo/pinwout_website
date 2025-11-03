'use client';

import { useEffect, useState } from 'react';
import { Users, Brain, Zap, Target, Mountain, Battery, Heart, Shield, Lightbulb, Activity } from 'lucide-react';

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

      {/* Portfolio Section */}
      <section id="portfolio" className="section section-products">
        <div className="container">
          <div className={`animate-fade-in-up animate-delay-200 ${isVisible ? '' : 'opacity-0'}`}>
            <h2 className="text-h2 mb-6" style={{ textAlign: 'center' }}>Our Portfolio</h2>
            
            {/* Unpanic Project */}
            <div className="product-section mb-6">
              <h3 className="text-h2 text-accent mb-3">Unpanic</h3>
              <p className="text-subtitle mb-6">
                A system designed to help people with Complex PTSD identify and overcome their triggers and flashbacks for good
              </p>
              
              <div className="portfolio-grid mb-6">
                <div className="feature-card">
                  <div className="feature-icon">
                    <Heart size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Trauma-Informed Care</h4>
                  <p className="text-body">
                    Built with deep understanding of Complex PTSD, providing safe and effective tools for trauma recovery and emotional regulation.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Shield size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Trigger Identification</h4>
                  <p className="text-body">
                    Advanced pattern recognition helps users identify personal triggers and develop personalized coping strategies for lasting recovery.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Activity size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Real-Time Support</h4>
                  <p className="text-body">
                    Immediate access to grounding techniques and coping mechanisms when users need them most, preventing escalation of symptoms.
                  </p>
                </div>
                <div className="feature-card">
                  <div className="feature-icon">
                    <Lightbulb size={32} />
                  </div>
                  <h4 className="text-h3 mb-2">Evidence-Based Methods</h4>
                  <p className="text-body">
                    Incorporates proven therapeutic approaches and scientific research to provide effective, measurable progress in PTSD recovery.
                  </p>
                </div>
              </div>

              <a href="https://unpanic.app" target="_blank" rel="noopener noreferrer" className="btn btn-secondary">
                Try Unpanic Now
              </a>
            </div>

            {/* Gravity Product */}
            <div className="product-section mb-6">
              <h3 className="text-h2 text-accent mb-3">Gravity</h3>
              <p className="text-subtitle mb-6">
                Sustainable Energy Storage for Today's Grids
              </p>
              
              <div className="portfolio-grid mb-6">
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

            {/* Opper Product */}
            <div className="product-section">
              <h3 className="text-h2 text-accent mb-3">Opper</h3>
              <p className="text-subtitle mb-3">
                Simplified prioritization. Faster progression.
              </p>
              <p className="text-body mb-6" style={{ opacity: 0.8, fontStyle: 'italic' }}>
                Opper is in private beta. Join our waitlist to get early access and be the first to know when new spots open up.
              </p>
              
              <div className="portfolio-grid mb-6">
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

              <a href="mailto:hello@opper.dev" className="btn btn-primary">
                Contact Sales
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
              PinWout Venture Corp is a Calgary-based Micro-Angel investment fund focused on maximizing 
              efficiency and impact. We believe that with the right investment approach, small capital 
              inputs can generate extraordinary returns and technological breakthroughs.
            </p>
            <div className="team-grid mb-6">
              <div>
                <h3 className="text-h3 text-accent mb-2">Our Investment Philosophy</h3>
                <p className="text-body">
                  Focus on early-stage technologies that matter most. We identify and eliminate waste while 
                  amplifying results through intelligent capital deployment and strategic guidance.
                </p>
              </div>
              <div>
                <h3 className="text-h3 text-accent mb-2">Our Approach</h3>
                <p className="text-body">
                  We combine proven investment methodologies with hands-on technology development to help 
                  portfolio companies achieve outsized impact from modest beginnings.
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
            <h2 className="text-h2 mb-4">Ready to Connect?</h2>
            <p className="text-subtitle mb-6">
              Whether you're seeking investment or exploring partnership opportunities, 
              let's discuss how we can transform small inputs into powerful results together.
            </p>
            <a href="mailto:hello@pinwout.com" className="btn btn-primary">
              Get in Touch
            </a>
          </div>
        </div>
      </section>
    </>
  );
}
