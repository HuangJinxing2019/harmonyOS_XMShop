import { Router, Request, Response } from "express";
import userController from "../../controller/user/UserController";
import { validateRequestBody } from "../../middleware/validate";
import { IdSchema} from "../../entitiy";
import {checkToken} from "../../middleware/checkToken";

const router = Router();
router.post('/user/queryById', validateRequestBody(IdSchema), userController.queryUserById)

router.post('/user/queryUserInfo', checkToken, userController.queryUserInfo)

export default router
