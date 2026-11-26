import Stripe from 'stripe';
export function stripeTest(){const key=process.env.STRIPE_SECRET_KEY;if(!key?.startsWith('sk_test_'))throw new Error('Stripe test mode required');return new Stripe(key)}
