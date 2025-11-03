'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { Container } from '@/components/ui/Container';
import { Button } from '@/components/ui/Button';
import { FeatureCard } from '@/components/ui/Card';
import { Target, Sparkles, GraduationCap, Settings, ExternalLink, Download } from 'lucide-react';

const ProductsSection: React.FC = () => {
  const opperFeatures = [
    {
      icon: <Target size={24} />,
      title: 'Align your organization.',
      description: 'Your company is the most effective when everyone is rowing in the same direction. Opper measures and quantifies how well aligned your team is, and provides actionable insights to get everyone on the same page.'
    },
    {
      icon: <Sparkles size={24} />,
      title: 'Invisible intelligence.',
      description: 'Opper uses proven decision making frameworks and prioritization methods to bring data to your intuition and decision making. But you\'d never know it. Opper\'s intelligence is designed to stay out of your way.'
    },
    {
      icon: <GraduationCap size={24} />,
      title: 'Mastered in seconds.',
      description: 'Zero onboarding. Zero learning curve. Opper is intentionally designed to be mastered by anyone, anywhere in seconds. Because you\'re sick of overly complex project management platforms.'
    },
    {
      icon: <Settings size={24} />,
      title: 'Pared down prioritization.',
      description: 'You provide an input, Opper intelligently quantifies your priorities with a \'score\' that takes your perspective seriously. It\'s everything you need to make smarter decisions, and nothing you don\'t.'
    }
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.2
      }
    }
  };

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: { opacity: 1, y: 0 }
  };

  return (
    <section className="py-20 bg-primary-black text-white">
      <Container>
        {/* Opper Section */}
        <motion.div
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={containerVariants}
          className="mb-20"
        >
          <div className="flex flex-col lg:flex-row items-start justify-between mb-12">
            <motion.div variants={itemVariants} className="lg:w-1/3 mb-8 lg:mb-0">
              <div className="flex items-center mb-4">
                <h2 className="text-4xl font-bold text-accent-golden">Opper</h2>
              </div>
              <p className="text-2xl font-semibold mb-4 text-neutral-beige">
                Simplified prioritization. Faster progression.
              </p>
              <div className="flex flex-col space-y-4">
                <Button 
                  variant="secondary"
                  className="group w-fit"
                  onClick={() => window.open('https://www.opper.dev', '_blank')}
                >
                  Visit opper.dev
                  <ExternalLink className="ml-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </Button>
              </div>
            </motion.div>

            <motion.div variants={itemVariants} className="lg:w-1/3 text-right">
              <img 
                src="/app-stores.png" 
                alt="Available on App Store and Google Play"
                className="h-16 ml-auto"
              />
            </motion.div>
          </div>

          <motion.div 
            variants={containerVariants}
            className="grid grid-cols-1 md:grid-cols-2 gap-6"
          >
            {opperFeatures.map((feature, index) => (
              <motion.div key={index} variants={itemVariants}>
                <FeatureCard
                  icon={feature.icon}
                  title={feature.title}
                  description={feature.description}
                />
              </motion.div>
            ))}
          </motion.div>
        </motion.div>

        {/* Gravity Section */}
        <motion.div
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={containerVariants}
          className="bg-gradient-to-r from-primary-green to-primary-blue rounded-2xl p-8 lg:p-12"
        >
          <motion.div variants={itemVariants} className="max-w-4xl">
            <h2 className="text-4xl lg:text-5xl font-bold mb-4">
              <span className="text-white">Gravity</span>
            </h2>
            <p className="text-xl text-neutral-beige italic mb-8">
              Sustainable Energy Storage for Today's Grids
            </p>
            <div className="prose prose-lg prose-invert max-w-none mb-8">
              <p className="text-neutral-beige leading-relaxed">
                Gravity is PinWout's approach to stabilizing energy grids using mountain gravity 
                energy storage (MGES). By leveraging the natural force of gravity, this system 
                stores excess renewable energy during peak production and releases it during 
                periods of high demand.
              </p>
              <p className="text-neutral-beige leading-relaxed mt-4">
                With an emphasis on efficiency and sustainability, Gravity offers a cost-effective, 
                scalable alternative to traditional energy storage methods such as Pumped Hydro 
                and chemical batteries such as the Tesla Megapack.
              </p>
            </div>
            
            <motion.div variants={itemVariants}>
              <Button 
                variant="cta"
                className="group"
                onClick={() => window.open('https://firebasestorage.googleapis.com/v0/b/pinwout-bd900.firebasestorage.app/o/gravity_whitepaper_30-mar-2025.pdf?alt=media&token=14f6ba40-f986-4446-8f61-90453f37238b', '_blank')}
              >
                <Download className="mr-2 h-5 w-5" />
                Download Gravity Whitepaper
              </Button>
            </motion.div>
          </motion.div>
        </motion.div>
      </Container>
    </section>
  );
};

export { ProductsSection };