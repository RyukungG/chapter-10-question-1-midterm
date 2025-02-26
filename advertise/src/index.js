const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Serve static images
app.use('/images', express.static('images'));

// Advertisement data
const ads = [
  { name: 'Shopee', url: 'https://shopee.com', image: '/images/shopee.png' },
  { name: 'Lazada', url: 'https://lazada.com', image: '/images/lazada.png' },
  { name: 'Kaidee', url: 'https://www.kaidee.com', image: '/images/kaidee.png' }
];

// Endpoint to retrieve ads
app.get('/ads', (req, res) => {
  res.json(ads);
});

app.listen(port, () => {
  console.log(`Advertise service running on port ${port}`);
});
