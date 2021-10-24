import connection from "../database/database.js";
import bcrypt from 'bcrypt';
import { validateSingUp } from '../validateData/validateDate.js';

async function postSingUp(req, res){
    const { error } = validateSingUp.validate(req.body);
    if(error) {
        res.sendStatus(400) 
        console.log(error)
        return;
    }

    const { name, email, password } = req.body;
    const passwordHash = bcrypt.hashSync(password, 10);

    try{
        const result = await connection.query(`
            SELECT * FROM users WHERE email = $1;
        `, [email]);

        if(result.rows.length !== 0){
            res.sendStatus(409);
            return
        }

        await connection.query(`
        INSERT INTO users (name, email, password)
            VALUES ($1, $2, $3) ;
        `, [name, email, passwordHash]);

    res.sendStatus(201);
    }
    catch(error){
        console.log(error);
        res.sendStatus(500);
        return
    }
    
}

export{
    postSingUp
}