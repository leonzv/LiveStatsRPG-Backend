import { Router } from 'express'
import createPlayerController from '../controllers/playerController.js'

const router = Router()

router.post('/createPlayer', createPlayerController)

export default router
