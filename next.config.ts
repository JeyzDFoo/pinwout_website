import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'export',
  trailingSlash: true,
  images: {
    unoptimized: true
  },
  // Disable server-side features for static export
  experimental: {
    // Enable if you need app directory features
  },
  // Move Next.js development indicator to top-right (less intrusive)
  devIndicators: {
    position: 'top-right'
  }
};

export default nextConfig;
