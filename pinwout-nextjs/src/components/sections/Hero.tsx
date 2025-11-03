'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { Container } from '@/components/ui/Container';
import { Button } from '@/components/ui/Button';
import { ArrowRight, Play } from 'lucide-react';

const Hero: React.FC = () => {
  return (
    <section className="gradient-header text-white py-20 lg:py-32">
      <Container>
        <div className="text-center max-w-4xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
          >
            <h1 className="text-4xl lg:text-6xl font-bold mb-6">
              <span className="block">Power In,</span>
              <span className="block text-accent-golden">Work Out</span>
            </h1>
          </motion.div>

          <motion.p
            className="text-xl lg:text-2xl text-neutral-beige mb-8 leading-relaxed"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.2 }}
          >
            We transform small inputs into powerful results, focusing on efficiency and impact. 
            With our flagship app, <span className="text-accent-golden font-semibold">Opper</span>, 
            we are redefining how businesses operate.
          </motion.p>

          <motion.p
            className="text-lg text-neutral-beige/90 mb-12"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.4 }}
          >
            As one of Alberta's fastest growing tech companies, we are strategically positioning 
            ourselves to be a sustainable, decentralized, and diversified technology company.
          </motion.p>

          <motion.div
            className="flex flex-col sm:flex-row gap-4 justify-center items-center"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.6 }}
          >
            <Button 
              variant="cta" 
              size="lg"
              className="group"
              onClick={() => window.open('https://www.opper.dev', '_blank')}
            >
              Try Opper Now
              <ArrowRight className="ml-2 h-5 w-5 group-hover:translate-x-1 transition-transform" />
            </Button>
            
            <Button 
              variant="secondary" 
              size="lg"
              className="group"
              onClick={() => document.getElementById('about')?.scrollIntoView({ behavior: 'smooth' })}
            >
              <Play className="mr-2 h-5 w-5" />
              Learn More
            </Button>
          </motion.div>
        </div>
      </Container>

      {/* Decorative elements */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute -top-40 -right-40 w-80 h-80 bg-accent-golden/5 rounded-full blur-3xl" />
        <div className="absolute -bottom-40 -left-40 w-80 h-80 bg-primary-green/5 rounded-full blur-3xl" />
      </div>
    </section>
  );
};

export { Hero };