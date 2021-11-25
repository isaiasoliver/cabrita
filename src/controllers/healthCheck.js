
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

exports.health_check = async function (req, res) {
    const job = await prisma.user.findMany();
    res.json(
        {
            "service": "cabrita (prd)",
            "status": "OK",
            "database": "OK (0)",
            "time": new Date().toJSON()
        }
    )
};