import pool from '../config/database';
import { CondutorCreateType, CondutorUpdateType } from '../types/condutorTypes';

export default class Condutor {

    static async getAll() {

        const res = await pool.query('SELECT * FROM condutor');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM condutor WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: CondutorCreateType) {

        const res = await pool.query(
            'INSERT INTO condutor (id, cnh) VALUES ($1, $2) RETURNING *',
            [data.id, data.cnh]
        );

        return res.rows[0];
    }

    static async update(id: string, data: CondutorUpdateType) {

        const res = await pool.query(
            'UPDATE condutor SET cnh = $1 WHERE id = $2 RETURNING *',
            [data.cnh, id]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM condutor WHERE id = $1', [id]);
    }
}
