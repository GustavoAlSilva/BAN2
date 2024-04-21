import pool from '../config/database';
import { AlimentoCreateType, AlimentoUpdateType } from '../types/alimentoTypes';

export default class Alimento {

    static async getAll() {

        const res = await pool.query('SELECT * FROM alimento');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM alimento WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: AlimentoCreateType) {

        const res = await pool.query(
            'INSERT INTO alimento (nome, descricao) VALUES ($1, $2) RETURNING *',
            [data.nome, data.descricao]
        );

        return res.rows[0];
    }

    static async update(id: string, data: AlimentoUpdateType) {

        const res = await pool.query(
            'UPDATE alimento SET nome = $1, descricao = $2 WHERE id = $3 RETURNING *',
            [data.nome, data.descricao, id]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM alimento WHERE id = $1', [id]);
    }
}
