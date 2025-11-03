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
      // Create mailto link that sends email to hello@pinwout.com
      const subject = encodeURIComponent('Opper Beta Waitlist Signup');
      const body = encodeURIComponent(`Hi PinWout team,

I'd like to join the Opper beta waitlist.

Email: ${email}
Timestamp: ${new Date().toLocaleString()}
Source: PinWout Website

Please add me to the waitlist and notify me when beta spots become available.

Thanks!`);
      
      const mailtoUrl = `mailto:hello@pinwout.com?subject=${subject}&body=${body}`;
      
      // Open email client
      window.location.href = mailtoUrl;
      
      // Show success message
      setTimeout(() => {
        setStatus('success');
        setMessage('Your email client should have opened. Please send the email to complete your waitlist signup.');
        setEmail('');
      }, 500);
      
    } catch (error) {
      setStatus('error');
      setMessage('Something went wrong. Please email hello@pinwout.com directly.');
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
        <h3 className="text-xl font-semibold text-primary-green mb-2">Almost there!</h3>
        <p className="text-neutral-beige mb-4">{message}</p>
        <div className="space-y-2">
          <Button 
            variant="link" 
            size="sm"
            onClick={resetForm}
          >
            Join another email
          </Button>
          <p className="text-xs text-neutral-beige/60">
            Or email us directly at{' '}
            <a href="mailto:hello@pinwout.com" className="text-accent-golden hover:underline">
              hello@pinwout.com
            </a>
          </p>
        </div>
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
              Opening email...
            </>
          ) : (
            'Contact Sales'
          )}
        </Button>
      </form>

      <p className="text-xs text-neutral-beige/60 mt-4 text-center">
        This will open your email client to send us your waitlist request.
        <br />
        Alternatively, email us directly at{' '}
        <a href="mailto:hello@pinwout.com" className="text-accent-golden hover:underline">
          hello@pinwout.com
        </a>
      </p>
    </motion.div>
  );
};

export { OpperWaitlistForm };