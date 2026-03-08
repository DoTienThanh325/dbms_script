require('dotenv').config();
const express = require('express');
const { sql, poolPromise } = require('./db');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.static('public'));

app.post('/api/query', async (req, res) => {
    try {
        const { query } = req.body;
        
        if (!query) {
            return res.status(400).json({ error: 'SQL query is required' });
        }

        // Bước 2: Kiểm tra loại câu lệnh
        const upperQuery = query.trim().toUpperCase();
        
        // Chỉ nhận câu lệnh SELECT, bỏ qua DROP, DELETE, UPDATE, INSERT
        const forbiddenWords = ['DROP', 'DELETE', 'UPDATE', 'INSERT', 'ALTER', 'CREATE', 'TRUNCATE', 'EXEC'];
        
        // Kiểm tra xem query có bắt đầu bằng SELECT không
        if (!upperQuery.startsWith('SELECT')) {
            return res.status(403).json({ error: 'Only SELECT statements are allowed to prevent SQL Injection.' });
        }

        // Kiểm tra thêm các từ khóa cấm ở bên trong câu lệnh (một cách cơ bản)
        const containsForbidden = forbiddenWords.some(word => 
            new RegExp(`\\b${word}\\b`).test(upperQuery)
        );

        if (containsForbidden) {
            return res.status(403).json({ error: 'Query contains forbidden keywords.' });
        }

        // Bước 3, 4, 5: Kết nối và thực thi
        const pool = await poolPromise;
        const result = await pool.request().query(query);

        // Bước 6: Trả dữ liệu về Web
        res.json({
            success: true,
            columns: Object.keys(result.recordset && result.recordset[0] ? result.recordset[0] : {}),
            rows: result.recordset || [],
            rowsAffected: result.rowsAffected
        });

    } catch (err) {
        console.error('SQL Error:', err);
        res.status(500).json({ error: err.message || 'An error occurred during query execution.' });
    }
});

app.listen(port, () => {
    console.log(`Server listening on http://localhost:${port}`);
});
