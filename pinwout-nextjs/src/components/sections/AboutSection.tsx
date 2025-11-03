'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { Container } from '@/components/ui/Container';
import { Button } from '@/components/ui/Button';
import { Mail, MapPin } from 'lucide-react';

const AboutSection: React.FC = () => {
  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: { opacity: 1, y: 0 }
  };

  return (
    <section id="about" className="gradient-footer py-20 text-neutral-beige">
      <Container>
        <div className="max-w-4xl mx-auto">
          <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            transition={{ staggerChildren: 0.2 }}
            className="text-center mb-16"
          >
            <motion.h2 
              variants={itemVariants}
              className="text-4xl font-bold text-white mb-6"
            >
              What is PinWout?
            </motion.h2>
            
            <motion.p 
              variants={itemVariants}
              className="text-xl mb-8 leading-relaxed"
            >
              PinWout VC is a growing group of technical products. We're driven by the belief that 
              even the smallest, most basic inputs can lead to high-impact results when used effectively.
            </motion.p>

            <motion.blockquote 
              variants={itemVariants}
              className="text-2xl font-medium italic text-accent-golden mb-8"
            >
              "With everything we build, our mission is to turn what's already available 
              into something much greater."
            </motion.blockquote>

            <motion.div variants={itemVariants} className="prose prose-lg prose-invert max-w-none">
              <p className="leading-relaxed mb-6">
                With our flagship app, Opper, we're building a platform that empowers anyone to turn 
                everyday, subjective inputs into high-impact, life-changing results. We adopt that same 
                ethos when tackling bigger, global problems. With the right approach, any input — whether 
                energy, effort, or investment — can become something of much greater value.
              </p>
              
              <p className="leading-relaxed mb-8">
                We're building technologies that realize that concept at every possible level of impact.
              </p>

              <div className="flex items-center justify-center space-x-2 text-lg mb-12">
                <MapPin className="h-5 w-5 text-accent-golden" />
                <span>Proudly founded and located in Calgary, Alberta, Canada 🇨🇦</span>
              </div>
            </motion.div>

            <motion.div 
              variants={itemVariants}
              className="bg-primary-black/30 rounded-2xl p-8 backdrop-blur-sm"
            >
              <h3 className="text-2xl font-bold text-white mb-4">Get In Touch</h3>
              <p className="mb-6">
                Ready to transform your inputs into powerful results? Let's connect.
              </p>
              <Button 
                variant="cta"
                size="lg"
                className="group"
                onClick={() => document.getElementById('contact')?.scrollIntoView({ behavior: 'smooth' })}
              >
                <Mail className="mr-2 h-5 w-5" />
                Contact Us
              </Button>
            </motion.div>
          </motion.div>
        </div>
      </Container>
    </section>
  );
};

export { AboutSection };