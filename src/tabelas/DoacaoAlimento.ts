import pool from '../config/database';
import { DoacaoAlimentoCreateType, DoacaoAlimentoUpdateType } from '../types/doacaoAlimentoTypes';

export default class DoacaoAlimento {

    static async getAll() {

        const res = await pool.query('SELECT * FROM doacao_alimento');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM doacao_alimento WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: DoacaoAlimentoCreateType) {

        const res = await pool.query(
            `INSERT INTO doacao_alimento (id_solicitante, id_alimento, peso, id_condutor, id_estoque_alimento)
            VALUES ($1, $2, $3, $4, $5)
            RETURNING *`,
            [
                data.id_solicitante,
                data.id_alimento,
                data.peso,
                data.id_condutor,
                data.id_estoque_alimento
            ]
        );

        return res.rows[0];
    }

    static async update(id: string, data: DoacaoAlimentoUpdateType) {

        const res = await pool.query(
            `UPDATE doacao_alimento
            SET id_solicitante = $1,
                id_alimento = $2,
                peso = $3,
                id_condutor = $4,
                id_estoque_alimento = $5
            WHERE id = $6 RETURNING *`,
            [
                data.id_solicitante,
                data.id_alimento,
                data.peso,
                data.id_condutor,
                data.id_estoque_alimento,
                id
            ]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM doacao_alimento WHERE id = $1', [id]);
    }

    static async pegarTotalDoacoesPorSolicitante() {

        const res = await pool.query(`
            SELECT pessoa.id AS "ID Solicitante",
                pessoa.nome AS "Nome Solicitante",
                SUM(doacao_alimento.peso) AS "Total Recebido de Doações (KGs de alimentos)"
            FROM doacao_alimento
            LEFT JOIN solicitante ON doacao_alimento.id_solicitante = solicitante.id
            LEFT JOIN pessoa ON solicitante.id = pessoa.id
            GROUP BY pessoa.id;`
        );

        return res.rows;
    }
}
