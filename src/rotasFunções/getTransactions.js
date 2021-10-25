import connection from "../database/database.js";

async function getTransactions(req, res){
    const token = req.headers.authorization?.replace('Bearer ', '');

    if(!token) return res.sendStatus(401);

    try{
        const result = await connection.query(`
        SELECT * FROM sessions
        WHERE sessions.token = $1;
        `, [token]);
        console.log(result.rows)
        
       
        if(result.rowCount === 0){
            console.log("entrei")
            res.sendStatus(401);
            return
        }

        const user_id = result.rows[0].user_id;

        const resultTransaction = await connection.query(`
        SELECT * FROM transactions 
        WHERE id_cliente = $1;
        `,[user_id]);
        const transactions = resultTransaction.rows;
        
        res.send(transactions)

    }catch(er){
        console.log(er)
        res.sendStatus(500)
        return
    }

}

export{
    getTransactions
}