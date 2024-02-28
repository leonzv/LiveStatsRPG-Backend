import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function createPlayerController(req, res) {
    try {
        const { name, lvl, age, hp, money, xp, playerClass, historyId } = req.body;
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
        console.error('Erro ao criar jogador:', error)
        res.status(500).send('Erro ao criar jogador')
    }
}

export default createPlayerController