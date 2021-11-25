const express = require('express');
const app = express();

const healthCheckRouter = require('./src/routes/healthCheck');
const userRouter = require('./src/routes/user');

app.use(express.json());

app.use('/api', healthCheckRouter);
app.use('/api', userRouter);

app.listen(3000, () => {
    console.log('Start api at http://localhost:3000')
})