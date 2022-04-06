const routes = require('express').Router();

const db = require('../config/db_config');

const { QueryTypes, col } = require('sequelize');
const Sequelize = require('sequelize');


const totalRows = {
    "pws": 425899
}

routes.get('/:table/pagination', async (req, res, next) => {
    try {
        const table = req.params.table;
        const page = parseInt(req.query.page);
        const limit = parseInt(req.query.limit);
        const offset = page ? page * limit : 0;
        console.log(table, page, limit, offset);
        // const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table};`;
        // const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
        
        const query2 = `SELECT * FROM ${table} LIMIT ${offset}, ${limit};`;
        const results = await db.sequelize.query(query2, { type: Sequelize.QueryTypes.SELECT });
        const columns = Object.keys(results[0])
        const response = {
            columns,
            "totalItems": totalRows[table],// totalItems[0].TOTALROWS,
            "tableData": results,
        };
        return res.json(response);
    
    } catch (error) {
        const response = {
            "totalItems": 0,
            "columns": ["db_result"],
            "tableData": [{db_result: "No rows returned"}],
            "message": "Error-> Cannot complete a paging request!",
            "error": error.message
        };
        res.json(response);
    }
});


// http://localhost:3000/api/test/pagination?page=1&limit=2
module.exports = routes