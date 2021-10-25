import connection from "../database/database.js";

async function logout(req, res){
    const token = req.headers.authorization?.replace('Bearer ', '');

    if(!token) return res.sendStatus(401);
   
    try{
        const result = await connection.query(`
        SELECT * FROM sessions
        WHERE sessions.token = $1;
        `, [token]);
        
        if(result.rowCount === 0){
            res.sendStatus(401);
            return
        }
        
        await connection.query(`
        DELETE FROM sessions
        WHERE sessions.token = $1;
        `, [token]);

        res.send("ok")
        
    } catch (error) {
        res.sendStatus(500)
        return
    }
}

export{
    logout
}