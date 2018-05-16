import os

import stripe


stripe.api_key = os.environ.get('STRIPE_KEY', None)

email = os.environ.get('EMAIL', None)

customers = stripe.Customer.list(email=email)


if not customers:
    customer = stripe.Customer.create(email=email)
else:
    customer = customers['data'][0]

sc_id = customer.to_dict()['id']


invoice_item = stripe.InvoiceItem.create(
  amount=2100,
  currency='usd',
  customer=sc_id,
  description='One-time setup fee',
)


invoice = stripe.Invoice.create(
  customer=sc_id,
  billing='send_invoice',
  days_until_due=5,
)

print(invoice)