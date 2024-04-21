import pool from '../config/database';
import { CidadeCreateType, CidadeUpdateType } from '../types/cidadeTypes';

export default class Cidade {

    static async getAll() {

        const res = await pool.query('SELECT * FROM cidade');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM cidade WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: CidadeCreateType) {

        const res = await pool.query('INSERT INTO cidade (nome, uf_estado) VALUES ($1, $2) RETURNING *', [data.nome, data.uf_estado]);

        return res.rows[0];
    }

    static async update(id: string, data: CidadeUpdateType) {

        const res = await pool.query(
            'UPDATE cidade SET nome = $1, uf_estado = $2 WHERE id = $3 RETURNING *',
            [data.nome, data.uf_estado, id]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM cidade WHERE id = $1', [id]);
    }
}
