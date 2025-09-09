const express = require('express');
const cors = require('cors');
const { MongoClient, ObjectId } = require('mongodb');

const app = express();
app.use(cors());
app.use(express.json());

const uri = 'mongodb+srv://ahmedhassanc:Bholo321!!@rebuy.biofnkd.mongodb.net/?retryWrites=true&w=majority&appName=ReBuy';
const client = new MongoClient(uri);
let db, products, orders;

async function init() {
  await client.connect();
  db = client.db('market'); // as per your earlier naming
  products = db.collection('products');
  orders = db.collection('orders');

  // Seed sample products if empty
  const count = await products.countDocuments();
  if (count === 0) {
    await products.insertMany([
      { title: 'Lagoon Polo Shirt', image: '', price: 995, description: 'Dobby French Terry 240GSM' },
      { title: 'Kids Winter Suit', image: '', price: 1995, description: 'Best Boy Al Jobat' },
      { title: 'Denim Jeans', image: '', price: 1595, description: 'Slim fit, soft fabric' }
    ]);
  }
  console.log('Mongo ready');
}
init().catch(console.error);

// Routes
app.get('/api/products', async (req,res)=>{
  const list = await products.find().toArray();
  res.json(list);
});

app.get('/api/products/:id', async (req,res)=>{
  try{
    const doc = await products.findOne({_id: new ObjectId(req.params.id)});
    if(!doc) return res.status(404).json({error:'Not found'});
    res.json(doc);
  }catch(e){ res.status(400).json({error:'Bad id'}); }
});

app.post('/api/orders', async (req,res)=>{
  const payload = req.body || {};
  payload.createdAt = new Date();
  const r = await orders.insertOne(payload);
  res.status(201).json({ _id: r.insertedId, ok: true });
});

const PORT = process.env.PORT || 4445;
app.listen(PORT, ()=>console.log('Server running on', PORT));
