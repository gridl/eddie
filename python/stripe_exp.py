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
print(sc_id)


invoice_item = stripe.InvoiceItem.create(
  amount=2100,
  currency='usd',
  customer=sc_id,
  description='One-time setup fee',
)
print(invoice_item)


invoice = stripe.Invoice.create(
  customer=sc_id,
  billing='send_invoice',
  days_until_due=2,
)

print(invoice)

iid = invoice.to_dict()['id']
print(iid)


token = stripe.Token.create(
 card={
   "number": '4242424242424242',
   "exp_month": 12,
   "exp_year": 2019,
   "cvc": '123'
 },
)

stripe.Token.retrieve(token)


charge = stripe.Charge.create(
    amount=999,
    currency='usd',
    description='Example charge',
    source=token,
)
