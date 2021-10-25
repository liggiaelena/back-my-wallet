import connection from "../database/database.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

async function postLogIn(req, res){
    const { email, password } = req.body;

    const result = await connection.query(`
        SELECT * FROM users
        WHERE email = $1
    `,[email]);

    const user = result.rows[0];

    if(user && bcrypt.compareSync(password, user.password)) {
        const token = uuid();
        
        await connection.query(`
          INSERT INTO sessions (user_id, token)
          VALUES ($1, $2)
        `, [user.id, token]);

        res.status(200).send({
            id:user.id,
            name: user.name,
            email: user.email,
            token,
        });
        return

    } else {
       res.sendStatus(404);
       return
    }
}

export{
    postLogIn
}