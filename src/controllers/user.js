const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();


exports.list = async function (req, res) {
    const job = await prisma.user.findMany();
    res.json(job);
};

exports.create = async function (req, res) {
    const job = await prisma.user.create({ data: req.body });
    res.json(job);
};

