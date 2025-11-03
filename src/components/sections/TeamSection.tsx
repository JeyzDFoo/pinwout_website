'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { Container } from '@/components/ui/Container';
import { TeamCard } from '@/components/ui/Card';

const TeamSection: React.FC = () => {
  const team = [
    {
      name: "Jeremy Parker",
      role: "Jeremy is a seasoned leader and engineer with expertise in process automation, software development, and machine learning. He most recently lead the technical development at ZeroSound Systems, transforming a hardware-enabled software concept into a globally commercialized product.",
      image: "/jeremy.jpg"
    },
    {
      name: "Jonathan Johnson", 
      role: "JJ is a marketing leader with years of experience in SAAS and fintech startups. He recently grew Durable from 0 to a 15M Series A raise in 15 months, sat on the executive team at Bench Accounting, and has consulted multiple early-stage startups to successful acquisitions and VC raises.",
      image: "/jonathan.png"
    }
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.3
      }
    }
  };

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: { opacity: 1, y: 0 }
  };

  return (
    <section className="gradient-team py-20">
      <Container>
        <motion.div
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={containerVariants}
          className="text-center mb-16"
        >
          <motion.h2 
            variants={itemVariants}
            className="text-4xl font-bold text-white mb-4"
          >
            Who We Are
          </motion.h2>
          <motion.p 
            variants={itemVariants}
            className="text-xl text-neutral-beige max-w-3xl mx-auto"
          >
            Meet the founders of Calgary's innovative Micro-Angel investment fund, 
            building the future through strategic investments and hands-on development
          </motion.p>
        </motion.div>

        <motion.div
          variants={containerVariants}
          className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-4xl mx-auto"
        >
          {team.map((member, index) => (
            <motion.div key={index} variants={itemVariants}>
              <TeamCard
                name={member.name}
                role={member.role}
                image={member.image}
              />
            </motion.div>
          ))}
        </motion.div>
      </Container>
    </section>
  );
};

export { TeamSection };