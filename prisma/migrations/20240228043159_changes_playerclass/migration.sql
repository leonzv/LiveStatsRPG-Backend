/*
  Warnings:

  - You are about to drop the column `class` on the `Player` table. All the data in the column will be lost.
  - Added the required column `playerClass` to the `Player` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "historyId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL,
    "age" INTEGER NOT NULL,
    "hp" INTEGER NOT NULL,
    "money" INTEGER NOT NULL,
    "xp" INTEGER NOT NULL,
    "playerClass" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "deletedAt" DATETIME,
    CONSTRAINT "Player_historyId_fkey" FOREIGN KEY ("historyId") REFERENCES "History" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Player" ("age", "createdAt", "deletedAt", "historyId", "hp", "id", "lvl", "money", "name", "status", "updatedAt", "xp") SELECT "age", "createdAt", "deletedAt", "historyId", "hp", "id", "lvl", "money", "name", "status", "updatedAt", "xp" FROM "Player";
DROP TABLE "Player";
ALTER TABLE "new_Player" RENAME TO "Player";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
