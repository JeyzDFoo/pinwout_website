'use client';

import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Button } from '@/components/ui/Button';
import { Mail, CheckCircle, AlertCircle } from 'lucide-react';

interface OpperWaitlistFormProps {
  className?: string;
}

const OpperWaitlistForm: React.FC<OpperWaitlistFormProps> = ({ className = '' }) => {
  const [email, setEmail] = useState('');
  const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
  const [message, setMessage] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!email || !email.includes('@')) {
      setStatus('error');
      setMessage('Please enter a valid email address');
      return;
    }

    setStatus('loading');

    try {
      // Send email directly to hello@pinwout.com using EmailJS
      const response = await fetch('https://api.emailjs.com/api/v1.0/email/send', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          service_id: 'service_pinwout', // Replace with your EmailJS service ID
          template_id: 'template_waitlist', // Replace with your EmailJS template ID
          user_id: 'YOUR_EMAILJS_USER_ID', // Replace with your EmailJS user ID
          template_params: {
            to_email: 'hello@pinwout.com',
            from_name: 'PinWout Website',
            user_email: email,
            message: `New Opper waitlist signup:\n\nEmail: ${email}\nTimestamp: ${new Date().toLocaleString()}\nSource: PinWout Website`,
            subject: 'New Opper Beta Waitlist Signup'
          }
        }),
      });

      if (response.ok) {
        setStatus('success');
        setMessage('Thanks! You\'re on the Opper waitlist. We\'ll notify you when beta spots open up.');
        setEmail('');
      } else {
        throw new Error('Email sending failed');
      }
      
    } catch (error) {
      setStatus('error');
      setMessage('Something went wrong. Please try again or email hello@pinwout.com');
    }
  };

  const resetForm = () => {
    setStatus('idle');
    setMessage('');
  };

  if (status === 'success') {
    return (
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        className={`bg-primary-green/10 border border-primary-green/20 rounded-lg p-6 text-center ${className}`}
      >
        <CheckCircle className="h-12 w-12 text-primary-green mx-auto mb-4" />
        <h3 className="text-xl font-semibold text-primary-green mb-2">You're on the list!</h3>
        <p className="text-neutral-beige mb-4">{message}</p>
        <Button 
          variant="link" 
          size="sm"
          onClick={resetForm}
        >
          Join another email
        </Button>
      </motion.div>
    );
  }

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      className={`bg-primary-purple/20 border border-accent-golden/20 rounded-lg p-6 backdrop-blur-sm ${className}`}
    >
      <div className="flex items-center mb-4">
        <Mail className="h-6 w-6 text-accent-golden mr-3" />
        <div>
          <h3 className="text-lg font-semibold text-white">Join the Opper Beta</h3>
          <p className="text-sm text-neutral-beige/80">Be first in line for early access to Opper</p>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label htmlFor="waitlist-email" className="sr-only">
            Email address
          </label>
          <input
            id="waitlist-email"
            type="email"
            placeholder="Enter your email address"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            disabled={status === 'loading'}
            className="w-full px-4 py-3 bg-primary-black/50 border border-neutral-beige/20 rounded-lg text-white placeholder-neutral-beige/60 focus:outline-none focus:ring-2 focus:ring-accent-golden focus:border-transparent transition-all duration-200"
            required
          />
        </div>

        {status === 'error' && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: 'auto' }}
            className="flex items-center text-red-400 text-sm"
          >
            <AlertCircle className="h-4 w-4 mr-2 flex-shrink-0" />
            {message}
          </motion.div>
        )}

        <Button
          type="submit"
          variant="cta"
          className="w-full"
          disabled={status === 'loading'}
        >
          {status === 'loading' ? (
            <>
              <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-primary-black mr-2"></div>
              Joining waitlist...
            </>
          ) : (
            'Join Waitlist'
          )}
        </Button>
      </form>

      <p className="text-xs text-neutral-beige/60 mt-4 text-center">
        We'll never spam you. Unsubscribe at any time.
        <br />
        By signing up, you agree to our privacy policy.
      </p>
    </motion.div>
  );
};

export { OpperWaitlistForm };