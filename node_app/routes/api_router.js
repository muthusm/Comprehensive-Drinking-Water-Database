const routes = require('express').Router();

const db = require('../config/db_config');

const { QueryTypes, col } = require('sequelize');
const Sequelize = require('sequelize');


const tableRows = {
    "pws": 425899,
    "violation": 4687732,
    "site_visit": 2154196
}

routes.get('/:table/pagination', async (req, res) => {
    try {
        const table = req.params.table;
        const start = parseInt(req.query.start);
        const limit = parseInt(req.query.limit);
        // const offset = page ? page * limit : 0;
        console.log(table, start, limit);
        // const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table};`;
        // const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
        
        const query2 = `SELECT * FROM ${table} LIMIT ${start}, ${limit};`;
        const results = await db.sequelize.query(query2, { type: Sequelize.QueryTypes.SELECT });
        const columns = Object.keys(results[0])
        const response = {
            table,
            columns,
            "totalItems": tableRows[table],// totalItems[0].TOTALROWS,
            "tableData": results,
            start,
            limit,
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

routes.post('/:table/pagination', async (req, res) => {
    try {
        console.log(req.body)
        const table = req.params.table;
        const data = req.body.data || {};
        const start = parseInt(req.query.start) || 0;
        const limit = parseInt(req.query.limit) || 10;
        console.log(data);
        let totalRows = tableRows[table];
        let where_clause = '';
        if (Object.keys(data).length !== 0) {
            where_clause += 'WHERE '
            let first = true;
            Object.keys(data).forEach(column => {
                if(data[column]) {
                    if(!first) {
                        where_clause += ' AND ';
                    }
                    where_clause += `${column} = "${data[column]}"`;
                    first = false;
                }
            })
            const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table} ${where_clause};`;
            console.log(query1)
            const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
            totalRows = totalItems[0].TOTALROWS;
        } 
        
        
        const query2 = `SELECT * FROM ${table} ${where_clause} LIMIT ${start}, ${limit};`;
        const results = await db.sequelize.query(query2, { type: Sequelize.QueryTypes.SELECT });
        const columns = Object.keys(results[0])
        const response = {
            table,
            columns,
            totalRows,
            "tableData": results,
            start,
            limit,
        };
        return res.json(response);
    }  catch(err) {
        console.log(err);
        return res.status(404).json({
          message: "Filter Failed",
          error_msg: err.original.sqlMessage
        });
    }
});


// http://localhost:3000/api/test/pagination?page=1&limit=2
module.exports = routes