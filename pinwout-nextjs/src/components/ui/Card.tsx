import React from 'react';
import { cn } from '@/lib/utils';

interface CardProps {
  children: React.ReactNode;
  className?: string;
  variant?: 'feature' | 'team' | 'default';
}

const Card: React.FC<CardProps> = ({ 
  children, 
  className,
  variant = 'default'
}) => {
  return (
    <div
      className={cn(
        'rounded-xl transition-all duration-200 hover:-translate-y-1 hover:shadow-lg',
        {
          'feature-card': variant === 'feature',
          'team-card': variant === 'team',
          'bg-white p-6 shadow-sm border border-gray-200': variant === 'default',
        },
        className
      )}
    >
      {children}
    </div>
  );
};

// Feature Card specific component
interface FeatureCardProps {
  icon: React.ReactNode;
  title: string;
  description: string;
  className?: string;
}

const FeatureCard: React.FC<FeatureCardProps> = ({
  icon,
  title,
  description,
  className
}) => {
  return (
    <Card variant="feature" className={className}>
      <div className="flex items-start space-x-3 mb-3">
        <div className="flex-shrink-0 text-accent-light-green">
          {icon}
        </div>
        <h4 className="text-white/90 font-semibold text-lg">{title}</h4>
      </div>
      <p className="text-white/75 text-sm leading-relaxed flex-grow">
        {description}
      </p>
    </Card>
  );
};

// Team Card specific component
interface TeamCardProps {
  name: string;
  role: string;
  image: string;
  className?: string;
}

const TeamCard: React.FC<TeamCardProps> = ({
  name,
  role, 
  image,
  className
}) => {
  return (
    <Card variant="team" className={className}>
      <img 
        src={image}
        alt={`${name}, ${role}`}
        className="w-24 h-24 rounded-full object-cover mb-4 mx-auto"
      />
      <h3 className="text-white font-semibold text-xl mb-3 text-center">{name}</h3>
      <p className="text-white/80 text-sm leading-relaxed flex-grow text-center">
        {role}
      </p>
    </Card>
  );
};

export { Card, FeatureCard, TeamCard };