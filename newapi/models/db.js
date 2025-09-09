const mongoose = require('mongoose');
const uri = 'mongodb+srv://ahmedhassanc:Bholo321@hhhapp.o1bbonr.mongodb.net/';

const { Schema, model } = mongoose;

const userSchema = new Schema({
  name: String,
  email: String,
  age: Number
});

const User = model('User', userSchema);
module.exports = User;
