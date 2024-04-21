import pool from '../config/database';
import { EstadoCreateType, EstadoUpdateType } from '../types/estadoTypes';

export default class Estado {

    static async getAll() {

        const res = await pool.query('SELECT * FROM estado');

        return res.rows;
    }

    static async getOne(uf: string) {

        const res = await pool.query('SELECT * FROM estado WHERE uf = $1', [uf]);

        return res.rows[0];
    }

    static async create(data: EstadoCreateType) {

        const res = await pool.query('INSERT INTO estado (uf, nome) VALUES ($1, $2) RETURNING *', [data.uf, data.nome]);

        return res.rows[0];
    }

    static async update(uf: string, data: EstadoUpdateType) {

        const res = await pool.query('UPDATE estado SET nome = $1 WHERE uf = $2 RETURNING *', [data.nome, uf]);

        return res.rows[0];
    }

    static async delete(uf: string) {

        await pool.query('DELETE FROM estado WHERE uf = $1', [uf]);
    }
}
