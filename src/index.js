import express from 'express';
import { initializePrisma, disconnectPrisma } from './services/dbServices.js';
import playerRoutes from './routes/playerRoutes.js';
import cors from 'cors';
const app = express();

initializePrisma();

app.use(cors());
app.use(express.json());
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});
app.use(playerRoutes);

process.on('exit', () => {
  disconnectPrisma();
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});