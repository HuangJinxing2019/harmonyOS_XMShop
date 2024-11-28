import express, { Request, Response } from 'express';
import { addRouter } from './router'


const app = express()
const PORT = 3000;

// 接收application/json数据
app.use(express.json())
// 接收x-www-form-urlencoded数据
app.use(express.urlencoded({ extended: true }))
addRouter(app);

app.get('/', (req: Request, res: Response) => {
  res.send('你好')
})


app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`)
})
