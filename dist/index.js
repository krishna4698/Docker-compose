import express from 'express';
import { PrismaClient } from '@prisma/client';
const prismaclient = new PrismaClient();
const app = express();
app.get('/', async (req, res) => {
    const data = await prismaclient.user.findMany();
    res.json({
        data
    });
});
app.post('/post', async (req, res) => {
    await prismaclient.user.create({
        data: {
            username: "sahil",
            password: "sani;"
        }
    });
});
app.listen(3000);
//# sourceMappingURL=index.js.map