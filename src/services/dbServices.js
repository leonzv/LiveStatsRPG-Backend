import { PrismaClient } from '@prisma/client';

let prisma;

function initializePrisma() {
  prisma = new PrismaClient();
}

function disconnectPrisma() {
  if (prisma) {
    prisma.$disconnect();
  }
}

export { initializePrisma, disconnectPrisma };
