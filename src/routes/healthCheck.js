const express = require('express');
const router = express.Router();

var health_check_controller = require('../controllers/healthCheck');

router.get('/health', health_check_controller.health_check);

module.exports = router;