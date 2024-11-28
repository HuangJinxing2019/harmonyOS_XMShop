import { Router, Request, Response } from "express";
import authController from "../../controller/auth/AuthController";
import { validateRequestBody } from "../../middleware/validate";
import { RegisterSchema, LoginSchema } from "../../entitiy";

const router = Router();

router.post('/auth/register', validateRequestBody(RegisterSchema), authController.register)

router.post('/auth/login', validateRequestBody(LoginSchema), authController.login)

router.post('/auth/logout', authController.logout)

export default router
