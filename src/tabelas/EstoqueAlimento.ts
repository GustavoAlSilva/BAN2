import pool from '../config/database';
import { EstoqueAlimentoCreateType, EstoqueAlimentoUpdateType } from '../types/estoqueAlimentoTypes';

export default class EstoqueAlimento {

    static async getAll() {

        const res = await pool.query('SELECT * FROM estoque_alimento');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM estoque_alimento WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: EstoqueAlimentoCreateType) {

        const res = await pool.query(
            `INSERT INTO estoque_alimento (id_alimento, data_validade, peso, id_deposito)
            VALUES ($1, $2, $3, $4)
            RETURNING *`,
            [
                data.id_alimento,
                data.data_validade,
                data.peso,
                data.id_deposito
            ]
        );

        return res.rows[0];
    }

    static async update(id: string, data: EstoqueAlimentoUpdateType) {

        const res = await pool.query(
            `UPDATE estoque_alimento
            SET id_alimento = $1,
                data_validade = $2,
                peso = $3,
                id_deposito = $4
            WHERE id = $5 RETURNING *`,
            [
                data.id_alimento,
                data.data_validade,
                data.peso,
                data.id_deposito,
                id
            ]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM estoque_alimento WHERE id = $1', [id]);
    }
}
