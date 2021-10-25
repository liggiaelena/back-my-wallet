import connection from "../database/database.js";
import { validateTransaction } from '../validateData/validateDate.js';


async function postTransaction(req, res){
    const token = req.headers.authorization?.replace('Bearer ', '');
    const type = req.params.type;

    if(!token) return res.sendStatus(401);
    
    try{
        const result = await connection.query(`
        SELECT * FROM sessions
        WHERE sessions.token = $1;
        `, [token]);
       
        if(result.rowCount === 0){
            console.log("entrei")
            res.sendStatus(401);
            return
        }

        const user_id = result.rows[0].user_id;
        console.log(user_id)
        const{
            description,
            value
        } = req.body
        const date = new Date();

        const { error } = validateTransaction.validate(req.body);
        
        if(error) {
            res.sendStatus(400) 
            console.log(error)
            return;
        }

        await connection.query(`
        INSERT INTO transactions (id_cliente, date, description, value, type) 
            VALUES ($1, $2, $3, $4, $5);
        `, [user_id, date, description, value, type]); 

        res.sendStatus(200);
    }
    catch{
        res.sendStatus(500)
        return
    }
}

export{
    postTransaction
}