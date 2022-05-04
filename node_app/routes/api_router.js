const routes = require('express').Router();

const db = require('../config/db_config');

const { QueryTypes, col } = require('sequelize');
const Sequelize = require('sequelize');


const tableRows = {
    "pws": 425899,
    "violation": 4687732,
    "site_visit": 2154196,
    "facilities": 1449838,
    "pn_violations_assoc": 298518,
    "events_milestones": 178726,
    "geographic_areas": 567192,
    "lcr_samples": 760988,
    "ansi_areas": 3235,
    
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
        
        const query2 = `SELECT * FROM ${table} LIMIT ${start}, 1000;`;
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

routes.get('/:table/column/:column', async (req, res) => {
    try {
        const table = req.params.table;
        const column = req.params.column;
 
        const query = `SELECT DISTINCT ${column} FROM ${table};`;
        const results = await db.sequelize.query(query, { type: Sequelize.QueryTypes.SELECT });
        const values = [];
        console.log(results)
        results.forEach(data => {
            values.push(Object.values(data)[0]);
        } );
        // const columns = Object.keys(results[0])
        const response = {
            "tableData": values,
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
        const filter = req.body.filter;
        const start = parseInt(req.query.start) || 0;
        const client_limit = parseInt(req.query.limit) || 10;
        const server_limit = 500;
        console.log(filter);
        let totalRows = tableRows[table];
        let where_clause = '';
        if(filter) {
            where_clause += ` WHERE ${filter}`
            const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table}${where_clause};`;
            console.log(query1)
            const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
            totalRows = totalItems[0].TOTALROWS;
        }
        // if (Object.keys(filter).length !== 0) {
        //     where_clause += ' WHERE '
        //     let first = true;
        //     Object.keys(filter).forEach(column => {
        //         if(filter[column]) {
        //             if(!first) {
        //                 where_clause += ' AND ';
        //             }
        //             where_clause += `${column} = "${filter[column]}"`;
        //             first = false;
        //         }
        //     })
            
        //     const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table}${where_clause};`;
        //     console.log(query1)
        //     const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
        //     totalRows = totalItems[0].TOTALROWS;
        // } 
        where_clause += ' '
        const query2 = `SELECT * FROM ${table}${where_clause}LIMIT ${start}, ${server_limit};`;
        const results = await db.sequelize.query(query2, { type: Sequelize.QueryTypes.SELECT });
        if(!results.length){
            return res.status(404).json({
                message: "No rows returned for the given filter",
                error_msg: "No rows returned"
              });
        }
        // console.log(results);
        const columns = Object.keys(results[0])
        const response = {
            table,
            columns,
            totalRows,
            "tableData": results,
            filter,
            start,
            client_limit,
            server_limit,
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


routes.post('/report/:tables/pagination', async (req, res) => {
    try {
        console.log(req.body)
        const table = req.params.table || 'Report';
        const filter = req.body.filter;
        const start = parseInt(req.query.start) || 0;
        const client_limit = parseInt(req.query.limit) || 10;
        const server_limit = 500;
        const totalRows = 16;
        console.log(table)
        // console.log(filter);
        // let totalRows = tableRows[table];
        // let where_clause = '';
        // if(filter) {
        //     where_clause += ` WHERE ${filter}`
        //     const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table}${where_clause};`;
        //     console.log(query1)
        //     const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
        //     totalRows = totalItems[0].TOTALROWS;
        // }
        // // if (Object.keys(filter).length !== 0) {
        // //     where_clause += ' WHERE '
        // //     let first = true;
        // //     Object.keys(filter).forEach(column => {
        // //         if(filter[column]) {
        // //             if(!first) {
        // //                 where_clause += ' AND ';
        // //             }
        // //             where_clause += `${column} = "${filter[column]}"`;
        // //             first = false;
        // //         }
        // //     })
            
        // //     const query1 = `SELECT COUNT(*) AS TOTALROWS FROM ${table}${where_clause};`;
        // //     console.log(query1)
        // //     const totalItems = await db.sequelize.query(query1, { type: Sequelize.QueryTypes.SELECT });
        // //     totalRows = totalItems[0].TOTALROWS;
        // // } 
        // where_clause += ' '
        const query2 = `select p.state_code, t.violation_category_code, sum(violations) as num_violations from (select PWSID, VIOLATION_CATEGORY_CODE, count(*) AS violations from violation group by PWSID, VIOLATION_CATEGORY_CODE LIMIT 0, 500) t JOIN PWS p ON p.pwsid = t.pwsid where p.epa_region = '01' GROUP BY p.state_code, t.violation_category_code ORDER BY p.state_code, num_violations;`;
        const results = await db.sequelize.query(query2, { type: Sequelize.QueryTypes.SELECT });
        if(!results.length){
            return res.status(404).json({
                message: "No rows returned for the given filter",
                error_msg: "No rows returned"
              });
        }
        // console.log(results);
        const columns = Object.keys(results[0])
        const response = {
            table,
            columns,
            totalRows,
            "tableData": results,
            filter,
            start,
            client_limit,
            server_limit,
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