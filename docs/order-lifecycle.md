# Order lifecycle
Draft: customer reviews validated products and address; no purchase.
Pending: final price, tax, shipping and consent recorded; payment session created.
Paid: only verified payment webhook can transition to paid.
Production: staff checks artwork and releases job.
Shipped: carrier and tracking recorded.
Cancelled: authorized cancellation and refund workflow.
Never trust browser totals or payment success redirects. Use unique payment event IDs and transactionally apply transitions.
The draft SQL function is deliberately disabled for browser roles until a trusted execution path is implemented. No real orders are accepted.
