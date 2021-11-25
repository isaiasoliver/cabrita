const express = require('express');
const router = express.Router();

var user_controller = require('../controllers/user');

router.get('/user', user_controller.list);
router.post('/user', user_controller.create);

module.exports = router;