import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

const PlayerService = {
    createPlayer: async(name, lvl, age, hp, money, xp, playerClass, historyId) => {
        try {
            const newPlayer = await prisma.player.create({
                data: {
                    name,
                    lvl,
                    age,
                    hp,
                    money,
                    xp,
                    playerClass,
                    historyId,
                },
            });

            return newPlayer;
        } catch (error) {
            console.error('Erro ao criar jogador:', error)
            return null;
        }
    }
}

export default PlayerService