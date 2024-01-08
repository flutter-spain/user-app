const mongoose = require('mongoose');

async function connect() {
    await mongoose.connect('mongodb://localhost/flutter-node-tutorial', {
        useNewUrlParser: true
    })
        .then(() => console.log('DB is connected'))
        .catch(err => console.log(err));
}


module.exports = { connect };