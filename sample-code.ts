// Sample code to test Azure AI Foundry Theme syntax highlighting

/**
 * This is a multi-line comment
 * It should appear in green with italic style
 */

// Single line comment

import { useState, useEffect } from 'react';
import axios from 'axios';

// Constants and types
const API_URL = 'https://api.example.com';
const MAX_RETRIES = 3;

interface User {
  id: number;
  name: string;
  email: string;
  role: 'admin' | 'user' | 'guest';
}

// Class definition
class AzureService {
  private apiKey: string;
  
  constructor(apiKey: string) {
    this.apiKey = apiKey;
  }
  
  async fetchData(endpoint: string): Promise<any> {
    try {
      const response = await axios.get(`${API_URL}/${endpoint}`);
      return response.data;
    } catch (error) {
      console.error('Error fetching data:', error);
      throw error;
    }
  }
}

// Function with various syntax elements
function calculateTotal(items: number[], tax: number = 0.1): number {
  const subtotal = items.reduce((sum, item) => sum + item, 0);
  const total = subtotal * (1 + tax);
  
  if (total > 1000) {
    console.log('Large order detected');
  }
  
  return Math.round(total * 100) / 100;
}

// Arrow function
const greet = (name: string): string => {
  return `Hello, ${name}!`;
};

// Regular expressions
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const phoneRegex = /^\+?[\d\s-()]+$/;

// Object with methods
const config = {
  theme: 'azure-ai-foundry',
  colors: {
    primary: '#0078d4',
    secondary: '#68217a',
    accent: '#00b7c3'
  },
  enabled: true,
  version: 1.0
};

// Async/await example
async function processData() {
  const service = new AzureService('your-api-key');
  
  try {
    const users = await service.fetchData('users');
    const processed = users.map((user: User) => ({
      ...user,
      displayName: `${user.name} (${user.role})`
    }));
    
    return processed;
  } catch (error) {
    console.error('Processing failed:', error);
    return [];
  }
}

// Template literals
const message = `
  Welcome to Azure AI Foundry Theme!
  Primary color: ${config.colors.primary}
  Version: ${config.version}
`;

// Control flow
for (let i = 0; i < 10; i++) {
  if (i % 2 === 0) {
    console.log(`${i} is even`);
  } else {
    console.log(`${i} is odd`);
  }
}

// Export
export { AzureService, calculateTotal, greet, config };
export default processData;
