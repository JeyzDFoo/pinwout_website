import React from 'react';

interface PinWoutLogoProps {
  size?: number;
  className?: string;
}

const PinWoutLogo: React.FC<PinWoutLogoProps> = ({ 
  size = 48, 
  className = '' 
}) => {
  return (
    <div 
      className={`inline-flex items-center justify-center ${className}`}
      style={{ width: size, height: size }}
    >
      <svg 
        width={size} 
        height={size} 
        viewBox="0 0 100 100" 
        className="rounded-lg"
      >
        {/* Black background */}
        <rect width="100" height="100" rx="10" fill="#000000"/>
        
        {/* Yellow wave (top) */}
        <path 
          d="M15,25 Q35,10 55,25 Q75,40 90,25" 
          stroke="#ffff00" 
          strokeWidth="4" 
          fill="none" 
          strokeLinecap="round" 
          opacity="0.6"
        />
        
        {/* Cyan wave (middle) */}
        <path 
          d="M10,50 Q30,65 50,50 Q70,35 90,50" 
          stroke="#00ffff" 
          strokeWidth="4" 
          fill="none" 
          strokeLinecap="round" 
          opacity="0.7"
        />
        
        {/* Magenta wave (bottom) */}
        <path 
          d="M15,75 Q35,90 55,75 Q75,60 90,75" 
          stroke="#ff00ff" 
          strokeWidth="4" 
          fill="none" 
          strokeLinecap="round" 
          opacity="0.6"
        />
      </svg>
    </div>
  );
};

// Logo with text
interface PinWoutLogoWithTextProps {
  size?: number;
  className?: string;
  showTagline?: boolean;
}

const PinWoutLogoWithText: React.FC<PinWoutLogoWithTextProps> = ({ 
  size = 48,
  className = '',
  showTagline = false 
}) => {
  return (
    <div className={`flex items-center space-x-3 ${className}`}>
      <PinWoutLogo size={size} />
      <div className="flex flex-col">
        <span className="font-bold text-xl text-white">PinWout</span>
        {showTagline && (
          <span className="text-sm text-neutral-beige opacity-80">
            Power In, Work Out
          </span>
        )}
      </div>
    </div>
  );
};

export { PinWoutLogo, PinWoutLogoWithText };