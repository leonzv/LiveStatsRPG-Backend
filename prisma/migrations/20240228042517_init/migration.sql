-- CreateTable
CREATE TABLE "History" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "gameMaster" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "deletedAt" DATETIME
);

-- CreateTable
CREATE TABLE "Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "historyId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL,
    "age" INTEGER NOT NULL,
    "hp" INTEGER NOT NULL,
    "money" INTEGER NOT NULL,
    "xp" INTEGER NOT NULL,
    "class" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "deletedAt" DATETIME,
    CONSTRAINT "Player_historyId_fkey" FOREIGN KEY ("historyId") REFERENCES "History" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
