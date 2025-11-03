import React from 'react';
import { cn } from '@/lib/utils';

interface ContainerProps {
  children: React.ReactNode;
  className?: string;
  size?: 'sm' | 'md' | 'lg' | 'xl' | 'full';
}

const Container: React.FC<ContainerProps> = ({ 
  children, 
  className,
  size = 'lg' 
}) => {
  return (
    <div
      className={cn(
        'mx-auto px-4 sm:px-6 lg:px-8',
        {
          'max-w-3xl': size === 'sm',
          'max-w-5xl': size === 'md', 
          'max-w-7xl': size === 'lg',
          'max-w-none': size === 'xl',
          'w-full': size === 'full',
        },
        className
      )}
    >
      {children}
    </div>
  );
};

export { Container };