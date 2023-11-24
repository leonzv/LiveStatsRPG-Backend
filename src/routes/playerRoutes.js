import { Router } from 'express';
const router = Router();
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

router.post('/createPlayer', async (req, res) => {
  try {
      const { name, lvl, age, hp, money, xp, playerClass, historyId } = req.body;
    console.log(req.body);
      // const historyFind = await prisma.history.findUnique({
      //   where: {
      //     id: historyId,
      //   },
      // });
    const newPlayer = await prisma.player.create({
      data: {
        name,
        lvl,
        age,
        hp,
        money,
        xp,
        playerClass,
        historyId: historyId,
      },
    });

    res.status(201).json(newPlayer);
  } catch (error) {
    console.error('Erro ao criar jogador:', error);
    res.status(500).send('Erro ao criar jogador');
  }
});

export default router;
