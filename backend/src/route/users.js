const { Router } = require('express');
const router = Router();

const User = require('../models/User');

const { faker } = require('@faker-js/faker');


// Delete all users
router.get('/api/user/deleteall', async (req, res) => {
    await User.deleteMany();
    res.json({
        message: 'All users deleted'
    });
});



router.get('/api/user', async (req, res) => {
    // with firstName and lastName
    const users = await User.find(
        
    );
    res.json({users:users});
});

router.get('/api/user/create', async (req, res) => {
    for (let i = 0; i < 5; i++) {
        await User.create({
            firstName: faker.internet.userName(),
            lastName: faker.internet.userName(),
            avatar: faker.image.avatar(),
        });
    }

    res.json({
        message: '5 User saved'
    });
});


module.exports = router;