import express from 'express';
import cors from 'cors';
import { postLogIn } from './rotasFunções/login.js';
import { postSingUp } from './rotasFunções/singup.js';
import { postTransaction } from './rotasFunções/transaction.js';
import { getTransactions } from './rotasFunções/getTransactions.js';
import { logout } from './rotasFunções/logout.js';

const app = express();
app.use(cors());
app.use(express.json());


app.post("/sing-in",postLogIn);

app.post("/sing-up",postSingUp);

app.post("/transaction/:type", postTransaction);

app.get("/transactions", getTransactions);

app.get("/logout", logout);

app.listen(4000);