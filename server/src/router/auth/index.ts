import { Router, Request, Response } from "express";
import authController from "../../controller/auth";
import { validateRequestBody } from "../../middleware/validate";
import { RegisterSchema } from "../../enter/AuthSchema";

const router = Router();

router.post('/auth/register', validateRequestBody(RegisterSchema), authController.register)

router.post('/auth/login', authController.login)

router.post('/auth/logout', authController.logout)

export default router
